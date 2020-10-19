import 'package:dio/dio.dart';
import 'package:flutter_provider_architecture/core/network/dio_provider.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';

class NetworkLocator {
  static void setup() {
    locator.registerLazySingleton<Dio>(() => DioProvider.create());
  }
}
