import 'package:flutter_provider_architecture/core/provider_viewmodel.dart';
import 'package:flutter_provider_architecture/core/storage/storage.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/login/user.dart';

class PostViewModel extends ProviderViewModel {
  Storage storage = locator<Storage>();

  User getUser() => storage.getUser();
}
