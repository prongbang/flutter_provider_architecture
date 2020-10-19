import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/router/routers.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: 'login',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
