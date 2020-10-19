import 'package:flutter_provider_architecture/core/network/network_locator.dart';
import 'package:flutter_provider_architecture/core/storage/storage_locator.dart';
import 'package:flutter_provider_architecture/feature/home/home_locator.dart';
import 'package:flutter_provider_architecture/feature/login/login_locator.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comment_locator.dart';
import 'package:flutter_provider_architecture/feature/post/post_locator.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.I;

void setupLocator() {
  StorageLocator.setup();
  NetworkLocator.setup();
  CommentLocator.setup();
  LoginLocator.setup();
  HomeLocator.setup();
  PostLocator.setup();
}
