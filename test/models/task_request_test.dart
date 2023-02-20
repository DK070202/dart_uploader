import 'package:dart_uploader/models/task_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task request : ', () {
    test('Parsing the the request from the list', () {
      /// Arrange.
      const taskId = 'Some task Id';
      const path = '<FILE PATH>';
      const url = '<The url>';
      const headers = {
        'Accept': "*/*",
        'Connection': 'keep-alive',
        'Content-Length': '<LENGTH>',
      };
      const fileEntity = FileEntity(path: path);
      const List<Object?> data = [taskId, url, 2, headers, path];

      /// Act.
      final request = TaskRequest.fromRawList(data);

      /// Assert.

      expect(request.taskId, taskId);

      expect(request.url, url);

      expect(request.method, HttpMethod.PATCH);

      expect(request.fileEntity, fileEntity);

      expect(request.headers, headers);
    });
  });
}
