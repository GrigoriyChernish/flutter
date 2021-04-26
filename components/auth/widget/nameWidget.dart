import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/components/textField/textFormField.dart';
import 'package:flutter_app/model/auth/formModel.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFiledText(
      id: FormKey.name,
      labelText: S.of(context).name,
      keyboardType: TextInputType.text,
      errorText: S.of(context).errorInputName,
    );
  }
}
