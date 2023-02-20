part of dart_uploader;

typedef OnUpload = void Function(int percentage);

@backgroundIsolate
class _NetworkClient {
  _NetworkClient() : _dio = Dio();
  final Dio _dio;

  Future<Response<T>> request<T>({
    required String url,
    dynamic data,
    required OnUpload cb,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.request<T>(
      url,
      data: data,
      cancelToken: cancelToken,
      onSendProgress: (count, total) {
        final percentage = ((count / total) * 100).round();
        cb(percentage);
      },
      options: options,
    );
  }
}
