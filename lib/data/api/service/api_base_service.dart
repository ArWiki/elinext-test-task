

abstract class ApiBaseService {
  Future<Response<T>> get<T>(String path,
      bool isResponseBytes,
      Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallBack inReceiveProgress,);
}