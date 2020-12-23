import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/provider_widget.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comment_widget.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';
import 'package:flutter_provider_architecture/feature/post/post_viewmodel.dart';

class PostPage extends StatelessWidget {
  final Post post;

  PostPage({this.post});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<PostViewModel>(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(post.title,
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w900)),
                Text(
                  'by ${model.getUser().name}',
                  style: TextStyle(fontSize: 9.0),
                ),
                Text(post.body),
                CommentWidget(post.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
