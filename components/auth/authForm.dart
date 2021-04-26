import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/forgotForm.dart';
import 'package:flutter_app/components/auth/loginForm.dart';
import 'package:flutter_app/components/auth/registrationForm.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../model/auth/formModel.dart';

class AuthForm extends StatefulWidget {
  AuthForm({Key key, this.child, this.btnText, this.selected})
      : super(key: key);

  final Widget child;
  final String btnText;
  final int selected;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> _widgetFormsText;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  static List<Widget> _widgetForms = <Widget>[
    LoginForm(),
    RegistrationForm(),
    ForgotForm(),
  ];

  get _getBtnTextForm {
    _widgetFormsText = <String>[
      S.of(context).btnOk,
      S.of(context).btnRegistre,
      S.of(context).btnNewPassword,
    ];
    return _widgetFormsText.elementAt(widget.selected);
  }

  _verification() {
    if (_formKey.currentState.validate()) {
      print(context.read<FormModel>().toJson());
    } else {
      _autovalidate = AutovalidateMode.onUserInteraction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidate,
              child: _widgetForms.elementAt(widget.selected),
            ),
          )),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(_getBtnTextForm),
                ),
                onPressed: () {
                  _verification();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
