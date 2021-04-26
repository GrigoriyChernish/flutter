import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
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
      labelText: S.of(context).confirmPassword,
      keyboardType: TextInputType.visiblePassword,
      errorText: S.of(context).errorInputConfirmPassword,
      obscureText: true,
    );
  }
}
