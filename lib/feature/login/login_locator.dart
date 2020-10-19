import 'dart:async';

import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/login_api.dart';
import 'package:flutter_provider_architecture/feature/login/login_repository.dart';
import 'package:flutter_provider_architecture/feature/login/login_viewmodel.dart';
import 'package:flutter_provider_architecture/feature/login/user.dart';

class LoginLocator {
  static void setup() {
    locator.registerLazySingleton<StreamController<User>>(
        () => StreamController<User>());
    locator.registerFactory<LoginApi>(() => HttpLoginApi());
    locator
        .registerLazySingleton<LoginRepository>(() => DefaultLoginRepository());
    locator.registerFactory(() => LoginViewModel());
  }
}
