import 'package:flutter_provider_architecture/feature/login/user.dart';
import 'package:get_storage/get_storage.dart';

abstract class Storage {
  void setUser(User user);
  User getUser();
}

class ShareStorage with Storage {
  final GetStorage storage;

  ShareStorage(this.storage);

  @override
  User getUser() => User.fromJson(storage.read("user"));

  @override
  void setUser(User user) => storage.write("user", user);
}
