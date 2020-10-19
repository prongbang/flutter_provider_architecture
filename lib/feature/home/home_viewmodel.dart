import 'package:flutter_provider_architecture/core/base_viewmodel.dart';
import 'package:flutter_provider_architecture/core/storage/storage.dart';
import 'package:flutter_provider_architecture/core/view_state.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/home/home_api.dart';
import 'package:flutter_provider_architecture/feature/login/user.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';

class HomeViewModel extends BaseViewModel {
  HomeApi _api = locator<HomeApi>();
  Storage storage = locator<Storage>();

  List<Post> posts;

  User getUser() => storage.getUser();

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
