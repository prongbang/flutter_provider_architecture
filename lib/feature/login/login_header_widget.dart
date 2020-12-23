import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  final TextEditingController controller;

  LoginHeaderWidget({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
        ),
        Text(
          'Enter a number between 1 - 10',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        LoginTextField(controller),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  LoginTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
        controller: controller,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
