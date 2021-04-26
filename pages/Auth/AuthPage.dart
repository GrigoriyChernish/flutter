import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../components/auth/authForm.dart';
import '../../model/auth/formModel.dart';

import 'package:flutter_app/generated/l10n.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _selected = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  static String title = S.of(context).title;
    return Provider(
      create: (_) => FormModel(),
      child: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 600,
                child: AuthForm(
                  selected: _selected,
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: S.of(context).loginTitle,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_add),
                label: S.of(context).registerTitle,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email),
                label: S.of(context).forgotPasswordTitle,
              ),
            ],
            currentIndex: _selected,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
