import 'package:dio/dio.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/user.dart';

abstract class LoginApi {
  Future<User> getUserProfile(int userId);
}

class HttpLoginApi implements LoginApi {
  Dio _dio = locator<Dio>();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    Response response = await _dio.get('/users/$userId');

    // Convert and return
    return User.fromJson(response.data);
  }
}
