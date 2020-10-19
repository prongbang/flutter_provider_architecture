import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/home/home_api.dart';
import 'package:flutter_provider_architecture/feature/home/home_viewmodel.dart';

class HomeLocator {
  static void setup() {
    locator.registerFactory<HomeApi>(() => HttpHomeApi());
    locator.registerFactory(() => HomeViewModel());
  }
}
