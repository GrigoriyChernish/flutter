import 'package:flutter/material.dart';
import 'package:flutter_app/model/auth/authModel.dart';
import 'package:flutter_app/model/user/userModel.dart';
import 'package:provider/provider.dart';
import '../../service/http/auth/AuthHttp.dart';
import '../../service/http/fetch/Response.dart';
import '../../generated/l10n.dart';
import '../../model/auth/formModel.dart';
import '../alertBar.dart';
import 'forgotForm.dart';
import 'loginForm.dart';
import 'registrationForm.dart';

class AuthForm extends StatefulWidget {
  AuthForm({Key? key, this.selected}) : super(key: key);

  final int? selected;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  late List<String> _widgetFormsText;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  static List<Widget> _widgetForms = <Widget>[
    LoginForm(key: ValueKey('LoginForm')),
    RegistrationForm(key: ValueKey('RegistrationForm')),
    ForgotForm(key: ValueKey('ForgotForm')),
  ];

  get _getBtnTextForm {
    _widgetFormsText = <String>[
      S.of(context).btnOk,
      S.of(context).btnRegistre,
      S.of(context).btnNewPassword,
    ];
    return _widgetFormsText.elementAt(widget.selected!);
  }

  get _getKey => _widgetForms.elementAt(widget.selected!).key;

  @override
  void initState() {
    super.initState();
    AuthHttp.headers({'X-Requested': 'fdsfasf'});
  }

  _getHttp() async {
    late Response response;
    FormModel data = context.read<FormModel>();

    if (_getKey == ValueKey('LoginForm')) {
      response = await AuthHttp.logIn(data.login());
      if (response.status == 200) {
        //  UserModel user = UserModel.fromJson(response.data as Map<String, dynamic>);
        context.read<Authentication>().set(AuthStatus.authenticated);
      }
    }

    if (_getKey == ValueKey('RegistrationForm')) {
      response = await AuthHttp.register(data.register());
      if (response.status == 200) {
        UserModel.fromJson(response.data as Map<String, dynamic>);
        Authentication().set(AuthStatus.authenticated);
      }
    }

    if (_getKey == ValueKey('ForgotForm')) {
      response = await AuthHttp.forgot(data.confirmPassword());
    }

    if (response.status == 200) {
      Alert.success(response.message).show(context);
    } else {
      Alert.error(response.message).show(context);
    }
  }

  _verification() {
    if (_formKey.currentState!.validate()) {
      _getHttp();
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidate,
              child: _widgetForms.elementAt(widget.selected!),
            ),
          )),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
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
