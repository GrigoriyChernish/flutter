import 'package:flutter/material.dart';
import 'package:flutter_app/components/textField/TextFormField.dart';

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
              child: Column(
                children: [
                  FormFiledText(
                    labelText: 'Електроный адрес',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ведите Електроный адрес';
                      }
                      return null;
                    },
                  ),
                  FormFiledText(
                    labelText: 'Пароль',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ведите Пароль';
                      }
                      return null;
                    },
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
                if (_formKey.currentState.validate()) {
                  print(_formKey.currentState);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
