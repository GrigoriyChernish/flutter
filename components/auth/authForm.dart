import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/auth/authModel.dart';
import '../../model/user/userModel.dart';
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
  static late List<String> _widgetFormsText;
  static late List<Widget> _widgetForms;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  get _getWidgetForms {
    _widgetForms = <Widget>[
      LoginForm(key: ValueKey('LoginForm')),
      RegistrationForm(key: ValueKey('RegistrationForm')),
      ForgotForm(key: ValueKey('ForgotForm')),
    ];
    return _widgetForms.elementAt(widget.selected!);
  }

  get _getBtnTextForm {
    _widgetFormsText = <String>[
      S.of(context).btnOk,
      S.of(context).btnRegistre,
      S.of(context).btnNewPassword,
    ];
    return _widgetFormsText.elementAt(widget.selected!);
  }

  get _getKeyWidget => _widgetForms.elementAt(widget.selected!).key;

  @override
  void initState() {
    super.initState();
    // AuthHttp.headers({'X-Requested': 'fdsfasf'});
  }

  _getHttp() async {
    late Response response;
    FormModel data = context.read<FormModel>();

    if (_getKeyWidget == ValueKey('LoginForm')) {
      response = await AuthHttp.logIn(data.login());
      if (response.status == 200) {
        // context.read<Authentication>().set(AuthStatus.authenticated);
      }
    }

    if (_getKeyWidget == ValueKey('RegistrationForm')) {
      response = await AuthHttp.register(data.register());
      if (response.status == 200) {
        UserModel.fromJson(response.data as Map<String, dynamic>);
        // context.read<Authentication>().set(AuthStatus.authenticated);
      }
    }

    if (_getKeyWidget == ValueKey('ForgotForm')) {
      response = await AuthHttp.forgot(data.confirmPassword());
    }

    if (response.status == 200) {
      Alert.success(response.message).show(context);
      context.read<Authentication>().set(AuthStatus.authenticated);
    } else {
      print(response.message);
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
              child: _getWidgetForms,
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
