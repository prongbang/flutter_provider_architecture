import 'package:flutter_provider_architecture/core/provider_state.dart';
import 'package:flutter_provider_architecture/core/provider_viewmodel.dart';
import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comment_api.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comments.dart';

class CommentViewModel extends ProviderViewModel {
  CommentApi _api = locator<CommentApi>();

  List<Comments> comments;

  Future fetchComments(int postId) async {
    setState(Loading());
    comments = await _api.getCommentsForPost(postId);
    setState(Idle());
  }
}
