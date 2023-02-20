part of dart_uploader;

@backgroundIsolate
class BgIsolateHandler {
  ReceivePort? _receivePort;

  SendPort? _mainIsolatePort;

  _BackgroundTaskManger? _backgroundTaskManger;

  void _init(SendPort sendPort) {
    /// Setting up the sendPort of main isolate in background isolate for
    /// communication.
    _mainIsolatePort = sendPort;

    /// ReceivePort for the background isolate.
    _receivePort = ReceivePort();

    /// Send back sendPort of the current isolate to the main isolate.
    _mainIsolatePort!.send(_receivePort!.sendPort);

    _backgroundTaskManger = _BackgroundTaskManger();

    /// Listen for message of task.
    _receivePort!.listen((message) async {
      if (message is List) {
        if (message.isEmpty || message.length != 2) return;
        _handleMessage(message.first, message[1]);
      }
    });
  }

  void _handleMessage(String method, Object? args) {
    if (method == _scheduleTask) {
      if (args == null) return;
      final request = TaskRequest.fromRawList(args as List);
      _scheduleUpload(request);
      return;
    }

    if (method == _cancelTask) {
      if (args == null) return;
      final info = Task.fromRaw(args as List);
      _cancelUpload(info);
      return;
    }
  }

  void _scheduleUpload(TaskRequest taskRequest) {
    _backgroundTaskManger!.scheduleTask(
      taskRequest,
      (task) {
        _mainIsolatePort!.send(SendPortMessageObject<List>(
          name: _postTaskUpdate,
          data: task,
        ).toRow());
      },
    );
  }

  void _cancelUpload(Task task) {
    _backgroundTaskManger!.cancelTask(
      task,
      (tsk) => _mainIsolatePort!.send(
        SendPortMessageObject<List>(
          name: _postTaskUpdate,
          data: tsk,
        ).toRow(),
      ),
    );
  }
}
