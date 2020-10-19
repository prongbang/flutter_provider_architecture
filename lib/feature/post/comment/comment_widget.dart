import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/base_widget.dart';
import 'package:flutter_provider_architecture/core/view_state.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comment_viewmodel.dart';
import 'package:flutter_provider_architecture/feature/post/comment/comments.dart';

class CommentWidget extends StatelessWidget {
  final int postId;

  CommentWidget(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentViewModel>(
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView(
                children: model.comments
                    .map((comment) => CommentItemWidget(comment))
                    .toList(),
              ),
            ),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItemWidget extends StatelessWidget {
  final Comments comment;

  const CommentItemWidget(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(255, 255, 246, 196)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(comment.body),
        ],
      ),
    );
  }
}
