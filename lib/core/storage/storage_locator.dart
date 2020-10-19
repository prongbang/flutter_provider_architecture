import 'package:flutter_provider_architecture/core/storage/storage.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class StorageLocator {
  static void setup() {
    locator.registerLazySingleton(() => GetStorage('MyPref'));
    locator.registerLazySingleton<Storage>(
        () => ShareStorage(GetIt.I.get<GetStorage>()));
  }
}
