part of dart_uploader;

class Task {
  final String taskId;
  final int percentage;
  final String url;
  final UploadingStatus status;
  final String? error;

  const Task({
    required this.taskId,
    this.percentage = 0,
    required this.url,
    this.status = UploadingStatus.enqueued,
    this.error,
  });

  factory Task.fromRaw(List<dynamic> data) {
    return Task(
      taskId: data[0],
      percentage: data[1],
      url: data[2],
      status: UploadingStatus.fromStatus(data[3]),
      error: data[4],
    );
  }

  Task copyWith({
    String? taskId,
    int? percentage,
    String? url,
    UploadingStatus? status,
    String? error,
  }) {
    return Task(
      taskId: taskId ?? this.taskId,
      percentage: percentage ?? this.percentage,
      url: url ?? this.url,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  List<dynamic> toRaw() {
    return [taskId, percentage, url, status.status, error];
  }
}

enum UploadingStatus {
  enqueued(0),
  uploading(1),
  completed(2),
  cancelled(3),
  failed(4);

  const UploadingStatus(this.status);
  final int status;

  factory UploadingStatus.fromStatus(int status) {
    if (status == 0) return UploadingStatus.enqueued;
    if (status == 1) return UploadingStatus.uploading;
    if (status == 2) return UploadingStatus.completed;
    if (status == 3) return UploadingStatus.cancelled;
    if (status == 4) return UploadingStatus.failed;
    return UploadingStatus.failed;
  }

  bool get isUploading => this == UploadingStatus.uploading;

  bool get isCompleted => this == UploadingStatus.completed;

  bool get isCancelled => this == UploadingStatus.cancelled;

  bool get isFailed => this == UploadingStatus.failed;
}
