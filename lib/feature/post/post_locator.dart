import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/post/post_viewmodel.dart';

class PostLocator {
  static void setup() {
    locator.registerFactory(() => PostViewModel());
  }
}
