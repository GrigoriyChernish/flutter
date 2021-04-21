import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/auth/loginForm.dart';
import '../../model/auth/loginFormModel.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginFormModel(),
      child: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.supervisor_account,
                      size: 120.0,
                    ),
                    Center(child: LoginForm()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
