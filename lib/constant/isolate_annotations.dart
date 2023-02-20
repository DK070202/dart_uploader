part of dart_uploader;

/// Helps to document the api according to the Isolate environment.
class IsolateAnnotation {
  const IsolateAnnotation(this.name);
  final String name;
}

/// Used to annotate APIs which are used by the background isolate.
const backgroundIsolate = IsolateAnnotation('Background Isolate');

/// Used to annotate APIs which are used by the main isolate.
const mainIsolate = IsolateAnnotation('Main Isolate');
