part of dart_uploader;

typedef UpdateListener = void Function(List<dynamic>);

class _BackgroundTaskManger {
  final _NetworkClient? _networkClient;

  _BackgroundTaskManger() : _networkClient = _NetworkClient();

  /// Holds the mapping of the tasks and relative [CancelToken].
  ///
  /// Helps to cancel the ongoing task.
  final Map<String, CancelToken> _cancelTokenContainer = {};

  /// Schedules the uploading and register token to container.
  ///
  /// Notifies state update to client by calling [cb] after converting it to raw
  /// data by [Task.toRaw].
  Future<void> scheduleTask(TaskRequest info, UpdateListener cb) async {
    final token = CancelToken();
    _cancelTokenContainer.putIfAbsent(info.taskId, () => token);

    try {
      final response = await uploadFile(
        info,
        (percentage) => cb(
          Task(
            taskId: info.taskId,
            percentage: percentage,
            url: info.url,
            status: RawUploadingStatus.uploading,
          ).toRaw(),
        ),
        token,
      );

      if (response.isSuccess) {
        cb(
          Task(
            percentage: 100,
            taskId: info.taskId,
            url: info.url,
            status: RawUploadingStatus.completed,
          ).toRaw(),
        );
        _cancelTokenContainer.remove(info.taskId);
      }
    } catch (error) {
      cb(
        Task(
          taskId: info.taskId,
          url: info.url,
          status: RawUploadingStatus.failed,
          error: error.toString(),
        ).toRaw(),
      );
      _cancelTokenContainer.remove(info.taskId);
    }
  }

  /// Cancels the ongoing uploading task and call [onCancelled] after
  /// cancellation of task.
  void cancelTask(Task info, UpdateListener onCancelled) {
    final token = _cancelTokenContainer[info.taskId];
    if (token != null) {
      _cancelTokenContainer.remove(info.taskId);
      token.cancel();
      final newInfo = info.copyWith(status: RawUploadingStatus.cancelled);
      onCancelled(newInfo.toRaw());
    }
  }

  /// Reads the file data at [FileEntity.path] and converts data in file binary
  /// data and pushes the data to destination [url] with [TaskRequest.method].
  Future<Response<T>> uploadFile<T>(
      TaskRequest info, OnUpload onUpload, CancelToken token) async {
    final throttler = Throttler();

    final url = info.url;
    final file = File(info.fileEntity.path);
    final fileBinary = file.readAsBytesSync();

    final options = Options(
      method: info.method.name,
      contentType: lookupMimeType(info.fileEntity.path),
      headers: info.headers,
    );

    return await _networkClient!.request(
      url: url,
      data: Stream.fromIterable(fileBinary.map((e) => [e])),
      cb: (progress) => throttler.run(() => onUpload(progress)),
      options: options,
      cancelToken: token,
    );
  }
}

extension ResponseHelper on Response {
  /// Short-hand for converting the status code in bool.
  bool get isSuccess => statusCode == 200;
}
