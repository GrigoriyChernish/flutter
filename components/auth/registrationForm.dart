import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/widget/confirmWidget.dart';
import 'package:flutter_app/components/auth/widget/emailWidget.dart';
import 'package:flutter_app/components/auth/widget/nameWidget.dart';
import 'package:flutter_app/components/auth/widget/passwordWidget.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.person_add,
              size: 120.0,
            ),
          ),
          NameWidget(),
          EmailWidget(),
          PasswordWidget(),
          ConfirmWidget(),
        ],
      ),
    );
  }
}
