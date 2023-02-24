part of dart_uploader;

typedef VoidCallback = void Function();

/// Default
const kDefaultThrottleDuration = Duration(milliseconds: 25);

class Throttler {
  Throttler({
    this.throttleDuration = kDefaultThrottleDuration,
  });

  final Duration throttleDuration;

  Timer? timer;

  void run(VoidCallback action) {
    if (timer?.isActive ?? false) return;
    timer?.cancel();
    action();
    timer = Timer(throttleDuration, () {});
  }

  void dispose() {
    timer?.cancel();
  }
}
