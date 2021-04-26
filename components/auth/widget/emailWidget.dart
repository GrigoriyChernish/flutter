import 'package:flutter/material.dart';
import 'package:flutter_app/components/textField/textFormField.dart';
import 'package:flutter_app/model/auth/formModel.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFiledText(
      id: FormKey.email,
      labelText: 'Електроный адрес',
      keyboardType: TextInputType.emailAddress,
      errorText: 'Електроный адрес',
    );
  }
}
