import 'package:flutter/material.dart';
import 'package:flutter_app/components/textField/textFormField.dart';
import 'package:flutter_app/model/auth/formModel.dart';
import 'package:flutter_app/generated/l10n.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFiledText(
      id: FormKey.email,
      labelText: S.of(context)!.email,
      keyboardType: TextInputType.emailAddress,
      errorText: S.of(context)!.errorInputEmail,
    );
  }
}
