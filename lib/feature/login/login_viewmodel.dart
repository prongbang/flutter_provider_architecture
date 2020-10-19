import 'package:flutter_provider_architecture/core/base_viewmodel.dart';
import 'package:flutter_provider_architecture/core/view_state.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/login_repository.dart';

class LoginViewModel extends BaseViewModel {
  final LoginRepository _loginRepository = locator<LoginRepository>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _loginRepository.login(userId);

    // Handle potential error here too.

    setState(ViewState.Idle);
    return success;
  }
}
