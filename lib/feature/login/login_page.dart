import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/base_widget.dart';
import 'package:flutter_provider_architecture/core/view_state.dart';
import 'package:flutter_provider_architecture/feature/login/login_header_widget.dart';
import 'package:flutter_provider_architecture/feature/login/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeaderWidget(
              validationMessage: model.errorMessage,
              controller: _controller,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
