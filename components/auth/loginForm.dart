import 'package:flutter/material.dart';
import 'package:flutter_app/model/auth/loginFormModel.dart';
import 'package:provider/provider.dart';
import '../textField/textFormField.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  FormFiledText(
                    key: Key('emailInput'),
                    labelText: 'Електроный адрес',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FormFiledText(
                    key: Key('passwordInput'),
                    labelText: 'Пароль',
                    keyboardType: TextInputType.number,
                  ),
                  /*                 Text('${context.watch<LoginFormModel>().getEmail}',
                      key: const Key('counterState'),
                      style: Theme.of(context).textTheme.headline4) */
                ],
              ),
            ),
          )),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: ElevatedButton(
              child: Text('Заходи четам'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(context.read<LoginFormModel>().password);
                  print(context.read<LoginFormModel>().email);
                  // print(context.read<LoginFormModel>().status);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
