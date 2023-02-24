part of dart_uploader;

@mainIsolate
class Uploader {
  const Uploader._();

  static const Uploader _instance = Uploader._();

  static Uploader get instance => _instance;

  /// Port of listening the update object from the background isolate.
  static ReceivePort? _receivePort;

  /// The background isolate reference.
  static Isolate? _backgroundIsolate;

  /// The bg isolate sendPort.
  static SendPort? _sendPort;

  /// Setups the port for communication and invokes the background isolate.
  ///
  /// Spawns the the background isolate with entrypoint as [_bgIsolateMain]. and
  /// as initial message it accepts the [SendPort] of mainIsolate.
  ///
  /// This future will complete when it receives the [SendPort] from the
  /// background isolate, means when this services is ready.
  static Future<void> initialize() async {
    final completer = Completer<SendPort>();

    _receivePort = ReceivePort();

    _backgroundIsolate = await Isolate.spawn<SendPort>(
      _bgIsolateMain,
      _receivePort!.sendPort,
      debugName: 'Background Isolate',
    );

    _receivePort!.listen((message) {
      log(message.toString());
      if (message is SendPort) {
        completer.complete(message);
      } else if (message is List) {
        if (message.isEmpty || message.length != 2) return;
        _handleMessage(message.first, message[1]);
      }
    });

    _sendPort = await completer.future;
  }

  /// Handles the message from the background isolate.
  static void _handleMessage(String method, Object? args) {
    if (method == _postTaskUpdate) {}
  }

  /// Enqueues the task in manger if the task was not registered against
  /// [uniqTaskId] and send the message to background isolate to enqueue the new
  /// task for downloading.
  ///
  /// If task was already registered then it will return the the state of the
  /// task in state of [Stream] against that [uniqTaskId].
  Task enqueueTheTask({
    required String url,
    required HttpMethod method,
    required String filePath,
    Map<String, dynamic>? headers,
  }) {
    assert(
      _sendPort != null,
      'The sendPort can\'t be null, Initialize the service first via await BackGroundService.init()',
    );
    final taskId = const Uuid().v1();

    final request = TaskRequest(
      taskId: taskId,
      url: url,
      method: method,
      fileEntity: FileEntity(
        path: filePath,
      ),
      headers: headers,
    );

    _sendPort?.send(
      SendPortMessageObject<List>(
        name: _scheduleTask,
        data: request.toRaw(),
      ).toRow(),
    );

    return Task(
      taskId: taskId,
      url: url,
    );
  }

  /// Entrypoint for background isolate.
  ///
  /// Initializes the [BgIsolateHandler] and assigns [sendPort] to the
  /// [BgIsolateHandler._mainIsolatePort] for communicate with main
  /// isolate.
  static void _bgIsolateMain(SendPort sendPort) {
    final bgIsolateService = BgIsolateHandler();
    bgIsolateService.init(sendPort);
  }

  /// Shutdowns the background isolate.
  static void shutDown() {
    _backgroundIsolate?.kill();

    _receivePort = null;
    _backgroundIsolate = null;
    _sendPort = null;
  }
}
