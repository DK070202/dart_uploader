/// An info class which hold requires the necessary info to upload file at
/// destination [url]

class TaskRequest {
  const TaskRequest({
    required this.taskId,
    required this.url,
    this.headers = const <String, String>{},
    required this.method,
    required this.fileEntity,
  });

  final String taskId;

  /// Upload link
  final String url;

  /// HTTP headers.
  final Map<String, dynamic>? headers;

  /// HTTP method to use for upload (POST,PUT,PATCH)
  final HttpMethod method;

  /// File entity.
  final FileEntity fileEntity;

  factory TaskRequest.fromRawList(List<dynamic> data) {
    return TaskRequest(
      taskId: data[0],
      url: data[1],
      method: HttpMethod.fromRawMethod(data[2]),
      headers: data[3],
      fileEntity: FileEntity(
        path: data[4],
      ),
    );
  }

  List<dynamic> toRaw() {
    return [taskId, url, method.method, headers, fileEntity.path];
  }
}

/// Represents the file to upload.

class FileEntity {
  /// Path of accessible file to upload.
  final String path;

  const FileEntity({
    required this.path,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is FileEntity && other.path == path;
  }

  @override
  int get hashCode => Object.hashAll([path]);
}

/// Defines the type of method which can be used to upload the provided file.
enum HttpMethod {
  POST(0),
  PUT(1),
  PATCH(2);

  const HttpMethod(this.method);
  final int method;

  factory HttpMethod.fromRawMethod(int method) {
    if (method == 0) return HttpMethod.POST;
    if (method == 1) return HttpMethod.PUT;
    if (method == 2) return HttpMethod.PATCH;
    throw Exception('Method not found');
  }
}
