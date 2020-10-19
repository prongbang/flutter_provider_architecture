import 'package:dio/dio.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';

abstract class HomeApi {
  Future<List<Post>> getPostsForUser(int userId);
}

class HttpHomeApi implements HomeApi {
  Dio _dio = locator<Dio>();

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    Response response = await _dio.get('/posts?userId=$userId');

    // parse into List
    var parsed = response.data as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }
}
