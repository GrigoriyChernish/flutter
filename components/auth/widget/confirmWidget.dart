import 'package:flutter/material.dart';
import 'package:flutter_app/components/textField/textFormField.dart';
import 'package:flutter_app/model/auth/formModel.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFiledText(
      id: FormKey.confirm,
      labelText: 'confirmPassword',
      keyboardType: TextInputType.visiblePassword,
      errorText: 'confirmPassword',
      obscureText: true,
    );
  }
}
