import 'package:flutter_provider_architecture/di/service_locator.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comment_viewmodel.dart';

import 'comment_api.dart';

class CommentLocator {
  static void setup() {
    locator.registerFactory<CommentApi>(() => HttpCommentApi());
    locator.registerFactory(() => CommentViewModel());
  }
}
