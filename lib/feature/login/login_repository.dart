import 'dart:async';

import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/login_api.dart';
import 'package:get_storage/get_storage.dart';

abstract class LoginRepository {
  Future<bool> login(int userId);
}

class DefaultLoginRepository extends LoginRepository {
  LoginApi _api = locator<LoginApi>();
  GetStorage _storage = locator<GetStorage>();

  @override
  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _storage.write("user", fetchedUser);
    }

    return hasUser;
  }
}
