import 'package:dart_uploader/dart_uploader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[Task request]:', () {
    group('Parsing http method -', () {
      test('POST', () {
        const value = 0;

        final parsedOne = HttpMethod.fromRaw(value);

        expect(parsedOne, HttpMethod.POST);
      });
      test('PUT', () {
        const value = 1;

        final parsedOne = HttpMethod.fromRaw(value);

        expect(parsedOne, HttpMethod.PUT);
      });
      test('PATCH', () {
        const value = 2;

        final parsedOne = HttpMethod.fromRaw(value);

        expect(parsedOne, HttpMethod.PATCH);
      });
      test('UNKNOWN', () {
        const value = 40;

        expect(
          () => HttpMethod.fromRaw(value),
          throwsA(const TypeMatcher<Exception>()),
        );
      });
    });

    group('Request Parsing', () {
      const taskId = 'Some task Id';
      const path = '<FILE PATH>';
      const url = '<The url>';
      const headers = {
        'Accept': "*/*",
        'Connection': 'keep-alive',
        'Content-Length': '<LENGTH>',
      };
      const method = 2;
      test('Deserialization', () {
        const fileEntity = FileEntity(path: path);
        const List<Object?> data = [taskId, url, method, headers, path];

        final request = TaskRequest.fromRaw(data);

        expect(request.taskId, taskId);
        expect(request.url, url);
        expect(request.method, HttpMethod.PATCH);
        expect(request.fileEntity, fileEntity);
        expect(request.headers, headers);
      });

      test('Serialization', () {
        const fileEntity = FileEntity(path: path);
        const List<Object?> data = [taskId, url, method, headers, path];
        final request = TaskRequest.fromRaw(data);

        final rawData = request.toRaw();

        expect(rawData.first, taskId);
        expect(rawData[1], url);
        expect(rawData[2], method);
        expect(rawData[3], headers);
        expect(rawData[4], fileEntity.path);
      });
    });
  });
}
