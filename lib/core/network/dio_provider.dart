import 'package:dio/dio.dart';

class DioProvider {
  static Dio create() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
