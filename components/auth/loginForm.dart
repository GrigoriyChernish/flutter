import 'package:flutter/material.dart';
import 'package:flutter_app/model/auth/formModel.dart';
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
                    key: Key('email'),
                    labelText: 'Електроный адрес',
                    keyboardType: TextInputType.emailAddress,
                    errorText: 'Електроный адрес',
                  ),
                  FormFiledText(
                    key: Key('password'),
                    labelText: 'Пароль',
                    keyboardType: TextInputType.number,
                    errorText: 'Пароль',
                  ),
                  FormFiledText(
                    key: Key('confirmPassword'),
                    labelText: 'confirmPassword',
                    keyboardType: TextInputType.visiblePassword,
                    errorText: 'confirmPassword',
                  ),
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
                print(context.read<FormModel>().password);
                print(context.read<FormModel>().email);
                // print(context.read<FormModel>().status);
              },
            ),
          ),
        ),
      ],
    );
  }
}
