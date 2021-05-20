import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/widget/emailWidget.dart';
import 'package:flutter_app/components/auth/widget/passwordWidget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EmailWidget(),
          PasswordWidget(),
        ],
      ),
    );
  }
}
