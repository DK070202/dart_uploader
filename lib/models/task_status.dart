import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_status.freezed.dart';

@freezed
class TaskStatus with _$TaskStatus {
  const TaskStatus._();

  factory TaskStatus.ongoing({
    required String taskId,
    required int percentage,
    required String url,
  }) = OnGoing;

  factory TaskStatus.completed({
    required String taskId,
    required String url,
  }) = Completed;

  factory TaskStatus.failed({
    required String taskId,
    required String url,
    String? error,
  }) = Failed;

  factory TaskStatus.cancelled({
    required String taskId,
    required String url,
  }) = Cancelled;

  bool get isOnGoing => this is OnGoing;
  bool get isCompleted => this is Completed;
  bool get cancelled => this is Cancelled;
  bool get isFailed => this is Failed;
}

/// Helps to form of `UploadTask` to map in-between.
extension StatusConverter on Task {
  /// Transforms the [Task] into [TaskStatus].
  TaskStatus get getMappingToUploadingTask {
    switch (status) {
      case RawUploadingStatus.uploading:
        return OnGoing(
          taskId: taskId,
          percentage: percentage,
          url: url,
        );

      case RawUploadingStatus.failed:
        return Failed(
          taskId: taskId,
          error: error,
          url: url,
        );

      case RawUploadingStatus.cancelled:
        return Cancelled(
          taskId: taskId,
          url: url,
        );

      case RawUploadingStatus.completed:
        return Completed(
          taskId: taskId,
          url: url,
        );
    }
  }
}

class Task {
  final String taskId;
  final int percentage;
  final String url;
  final RawUploadingStatus status;
  final String? error;

  const Task({
    required this.taskId,
    this.percentage = 0,
    required this.url,
    required this.status,
    this.error,
  });

  factory Task.fromRaw(List<dynamic> data) {
    return Task(
      taskId: data[0],
      percentage: data[1],
      url: data[2],
      status: RawUploadingStatus.fromStatus(data[3]),
      error: data[4],
    );
  }

  Task copyWith({
    String? taskId,
    int? percentage,
    String? url,
    RawUploadingStatus? status,
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

enum RawUploadingStatus {
  uploading(0),
  completed(1),
  cancelled(2),
  failed(3);

  const RawUploadingStatus(this.status);
  final int status;

  factory RawUploadingStatus.fromStatus(int status) {
    if (status == 0) return RawUploadingStatus.uploading;
    if (status == 1) return RawUploadingStatus.completed;
    if (status == 2) return RawUploadingStatus.cancelled;
    if (status == 3) return RawUploadingStatus.failed;
    return RawUploadingStatus.failed;
  }
}
