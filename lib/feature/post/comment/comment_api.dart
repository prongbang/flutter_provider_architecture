import 'package:dio/dio.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comments.dart';

abstract class CommentApi {
  Future<List<Comments>> getCommentsForPost(int postId);
}

class HttpCommentApi implements CommentApi {
  Dio _dio = locator<Dio>();

  Future<List<Comments>> getCommentsForPost(int postId) async {
    var comments = List<Comments>();

    // Get comments for post
    var response = await _dio.get('/comments?postId=$postId');

    // Parse into List
    var parsed = response.data as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comments.fromJson(comment));
    }

    return comments;
  }
}
