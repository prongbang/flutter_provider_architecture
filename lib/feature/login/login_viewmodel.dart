import 'package:flutter_provider_architecture/core/provider_state.dart';
import 'package:flutter_provider_architecture/core/provider_viewmodel.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/login_repository.dart';

class LoginViewModel extends ProviderViewModel {
  final LoginRepository _loginRepository = locator<LoginRepository>();

  Future<bool> login(String userIdText) async {
    setState(Loading());

    var userId = int.tryParse(userIdText);

    // Not a number
    if (userId == null) {
      setState(Error('Value entered is not a number'));
      return false;
    }

    var success = await _loginRepository.login(userId);
    if (!success) {
      setState(Error("Login failure!"));
    }

    return success;
  }
}
