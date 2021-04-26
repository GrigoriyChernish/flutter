import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/forgotForm.dart';
import 'package:flutter_app/components/auth/loginForm.dart';
import 'package:flutter_app/components/auth/registrationForm.dart';
import 'package:provider/provider.dart';

import '../../components/auth/authForm.dart';
import '../../model/auth/formModel.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  PageController _pageController;

  int _selected = 0;

  static List<Widget> _widgetForms = <Widget>[
    LoginForm(),
    RegistrationForm(),
    ForgotForm(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: _widgetForms.elementAt(_selected),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'Login',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_add),
                label: 'Registration',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email),
                label: 'Forgot',
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
