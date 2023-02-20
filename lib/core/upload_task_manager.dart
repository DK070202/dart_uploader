part of dart_uploader;

typedef ValueChanged<T> = void Function(T);

/// Keeps track of all ongoing uploading task.
///
/// When background isolates notifies for any update from all  ongoing task it
/// syncs the update with main Isolate by posting sequential update in form of
/// [TaskStatus].
@mainIsolate
class _UploadTaskManger {
  /// Holds all ongoing uploading task and their [StreamController] for updating
  /// task status in main thread.
  final Map<String, StreamController<TaskStatus>> _uploadMapping =
      <String, StreamController<TaskStatus>>{};

  /// Return all ongoing task manged by this.
  List<Stream<TaskStatus>> get getAllOngoingTask {
    return _uploadMapping.values.map((e) => e.stream).toList();
  }

  /// Short hand of retrieving any ongoing task from the [_uploadMapping].
  ///
  /// Returns the [StreamController] of any ongoing task against [taskId] else
  /// null.
  StreamController<TaskStatus>? operator [](String taskId) {
    final value = _uploadMapping[taskId];
    return value;
  }

  /// Short hand for appending new [StreamController] in [_uploadMapping].
  void operator []=(String key, StreamController<TaskStatus> task) {
    _uploadMapping[key] = task;
  }

  /// Syncs the latest retrieved state from the background isolate to main
  /// isolate by pushing the state in [StreamController] against taskId.
  ///
  /// Called when the background isolates notifies any update event.
  ///
  /// Clears the task from [_uploadMapping] if task is completed, cancelled or
  /// paused.
  void onReceiveUpdate(Task task) {
    final controller = this[task.taskId];
    if (controller == null) return;
    final taskStatus = task.getMappingToUploadingTask;
    controller.add(taskStatus);
    taskStatus.whenOrNull(
      cancelled: (taskId, url) => _closeAndRemoveTask(taskId),
      completed: (taskId, url) => _closeAndRemoveTask(taskId),
      failed: (taskId, url, error) => _closeAndRemoveTask(taskId),
    );
  }

  /// Removes the task from the map of ongoing task and disposes the
  /// [StreamController] against [taskId].
  void _closeAndRemoveTask(String taskId) {
    final controller = this[taskId];
    controller?.close();
    _uploadMapping.remove(taskId);
  }

  /// Appends the new [TaskStatus] in [_uploadMapping].
  ///
  /// If task with unique id already exists in the this manger then returns the
  /// streaming state of related task against that [uniqTaskId].
  ///
  /// If task is newly scheduled task then it registers the task in
  /// [_uploadMapping] and calls [onSuccessfullyRegisterTask]. And returns the
  /// stream against the [uniqTaskId] for listening updates.
  Stream<TaskStatus> enqueueTheTask({
    required String url,
    required HttpMethod method,
    required String filePath,
    Map<String, dynamic>? headers,
    String? uniqTaskId,
    required ValueChanged<TaskRequest> onSuccessfullyRegisterTask,
  }) {
    final request = TaskRequest(
      taskId: uniqTaskId ?? const Uuid().v1(),
      url: url,
      method: method,
      fileEntity: FileEntity(
        path: filePath,
      ),
      headers: headers,
    );

    if (this[request.taskId] != null) {
      return this[request.taskId]!.stream;
    }

    final streamController = StreamController<TaskStatus>();
    this[request.taskId] = streamController;

    onSuccessfullyRegisterTask(request);

    return streamController.stream;
  }
}
