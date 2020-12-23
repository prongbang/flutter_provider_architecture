import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/provider_state.dart';
import 'package:flutter_provider_architecture/core/provider_widget.dart';
import 'package:flutter_provider_architecture/feature/home/home_viewmodel.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';
import 'package:flutter_provider_architecture/feature/post/post_list_item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeViewModel>(
      initial: (viewModel) => viewModel.getPosts(viewModel.getUser().id),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: (() {
            if (model.state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome ${model.getUser().name}',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Here are all your posts',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ),
                Expanded(child: getPostsUi(model.posts)),
              ],
            );
          }()),
        ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItemWidget(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      );
}
