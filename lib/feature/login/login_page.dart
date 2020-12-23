import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/provider_state.dart';
import 'package:flutter_provider_architecture/core/provider_widget.dart';
import 'package:flutter_provider_architecture/feature/login/login_header_widget.dart';
import 'package:flutter_provider_architecture/feature/login/login_viewmodel.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      builder: (context, viewModel, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeaderWidget(controller: _controller),

            // Error
            (() {
              if (viewModel.state is Error) {
                var error = viewModel.state as Error;
                return Text(error.data, style: TextStyle(color: Colors.red));
              }
              return SizedBox();
            }()),

            // State
            (() {
              if (viewModel.state is Loading) {
                return CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  color: Colors.blueAccent,
                  height: 50,
                  minWidth: double.infinity,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var state = await viewModel.login(_controller.text);
                    if (state) {
                      Get.offAndToNamed('/');
                    }
                  },
                ),
              );
            }())
          ],
        ),
      ),
    );
  }
}
