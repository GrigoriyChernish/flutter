import 'package:flutter/material.dart';
import 'package:flutter_app/components/textField/textFormField.dart';
import 'package:flutter_app/model/auth/formModel.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFiledText(
      id: FormKey.password,
      labelText: 'Пароль',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      errorText: 'Пароль',
    );
  }
}
