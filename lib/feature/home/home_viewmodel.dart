import 'package:flutter_provider_architecture/core/provider_state.dart';
import 'package:flutter_provider_architecture/core/provider_viewmodel.dart';
import 'package:flutter_provider_architecture/core/storage/storage.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/home/home_api.dart';
import 'package:flutter_provider_architecture/feature/login/user.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';

class HomeViewModel extends ProviderViewModel {
  HomeApi _api = locator<HomeApi>();
  Storage storage = locator<Storage>();

  List<Post> posts;

  User getUser() => storage.getUser();

  Future getPosts(int userId) async {
    setState(Loading());
    posts = await _api.getPostsForUser(userId);
    setState(Idle());
  }
}
