import 'package:dart_uploader/dart_uploader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[Task]:', () {
    group('Parsing task status -', () {
      test('ENQUEUED', () {
        const value = 0;

        final parsedOne = UploadingStatus.fromRaw(value);

        expect(parsedOne, UploadingStatus.enqueued);
      });
      test('UPLOADING', () {
        const value = 1;

        final parsedOne = UploadingStatus.fromRaw(value);

        expect(parsedOne, UploadingStatus.uploading);
      });
      test('COMPLETED', () {
        const value = 2;

        final parsedOne = UploadingStatus.fromRaw(value);

        expect(parsedOne, UploadingStatus.completed);
      });
      test('CANCELLED', () {
        const value = 3;

        final parsedOne = UploadingStatus.fromRaw(value);

        expect(parsedOne, UploadingStatus.cancelled);
      });
      test('FAILED', () {
        const value = 4;

        final parsedOne = UploadingStatus.fromRaw(value);

        expect(parsedOne, UploadingStatus.failed);
      });
      test('UNKNOWN', () {
        const value = 40;

        expect(
          () => UploadingStatus.fromRaw(value),
          throwsA(const TypeMatcher<Exception>()),
        );
      });
    });

    group('Task Parsing', () {
      const taskId = 'Some task Id';
      const percentage = 47;
      const status = 1;
      const url = '<URL>';
      const List<Object?> data = [taskId, percentage, url, status, null];
      final task = Task.fromRaw(data);

      test('Deserialization', () {
        expect(task.taskId, taskId);
        expect(task.percentage, percentage);
        expect(task.url, url);
        expect(task.status, UploadingStatus.uploading);
        expect(task.error, null);
      });

      test('Serialization', () {
        final rawData = task.toRaw();

        expect(rawData.first, taskId);
        expect(rawData[1], percentage);
        expect(rawData[2], url);
        expect(rawData[3], status);
        expect(rawData[4], null);
      });
    });
  });
}
