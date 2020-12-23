import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/feature/home/home_page.dart';
import 'package:flutter_provider_architecture/feature/login/login_page.dart';
import 'package:flutter_provider_architecture/feature/post/post.dart';
import 'package:flutter_provider_architecture/feature/post/post_page.dart';

class Routers {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostPage(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
