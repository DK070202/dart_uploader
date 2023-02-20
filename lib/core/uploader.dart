part of dart_uploader;

@mainIsolate
class Uploader {
  Uploader._();

  static final Uploader _instance = Uploader._();

  static Uploader get instance => _instance;

  /// Port of listening the update object from the background isolate.
  static ReceivePort? _receivePort;

  /// The background isolate reference.
  static Isolate? _backgroundIsolate;

  /// The bg isolate sendPort.
  static SendPort? _sendPort;

  /// Manages all ongoing uploads.
  static _UploadTaskManger? _manager;

  /// Returns all ongoing task.
  static List<Stream<TaskStatus>> get getAllOngoingTask =>
      _manager!.getAllOngoingTask;

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

    _manager = _UploadTaskManger();

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
    if (method == _postTaskUpdate) {
      _manager!.onReceiveUpdate(Task.fromRaw(args as List));
    }
  }

  /// Enqueues the task in manger if the task was not registered against
  /// [uniqTaskId] and send the message to background isolate to enqueue the new
  /// task for downloading.
  ///
  /// If task was already registered then it will return the the state of the
  /// task in state of [Stream] against that [uniqTaskId].
  Stream<TaskStatus> enqueueTheTask({
    required String url,
    required HttpMethod method,
    required String filePath,
    Map<String, dynamic>? headers,
    String? uniqTaskId,
  }) {
    assert(
      _sendPort != null,
      'The sendPort can\'t be null, Initialize the service first via await BackGroundService.init()',
    );
    return _manager!.enqueueTheTask(
      url: url,
      method: method,
      filePath: filePath,
      headers: headers,
      onSuccessfullyRegisterTask: (request) => _sendPort?.send(
        SendPortMessageObject<List>(
          name: _scheduleTask,
          data: request.toRaw(),
        ).toRow(),
      ),
    );
  }

  /// Entrypoint for background isolate.
  ///
  /// Initializes the [BgIsolateHandler] and assigns [sendPort] to the
  /// [BgIsolateHandler._mainIsolatePort] for communicate with main
  /// isolate.
  static void _bgIsolateMain(SendPort sendPort) {
    final bgIsolateService = BgIsolateHandler();
    bgIsolateService._init(sendPort);
  }

  /// Shutdowns the background isolate.
  static void shutDown() {
    _backgroundIsolate?.kill();
    _manager = null;
    _receivePort = null;
    _backgroundIsolate = null;
    _sendPort = null;
  }
}
