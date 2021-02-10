import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Style/MainStyle.dart';

class FormFiledText extends StatefulWidget {
  FormFiledText({
    Key key,
    this.labelText,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final String labelText;
  final FormFieldValidator validator;
  final ValueChanged<String> onChanged;

  @override
  _FormFiledTextState createState() =>
      _FormFiledTextState(labelText, validator, onChanged);
}

class _FormFiledTextState extends State<FormFiledText> {
  String _labelText;
  final FormFieldValidator _validator;
  final ValueChanged<String> _onChanged;

  _FormFiledTextState(this._labelText, this._validator, this._onChanged);

  FocusNode _focus;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _focus.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focus.hasFocus != _focused) {
      setState(() {
        _focused = _focus.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        focusNode: _focus,
        textAlign: TextAlign.center,
        style: buildTextStyle(),
        decoration: buildInputDecoration(),
        onSaved: (val) => {print(val)},
        validator: (val) => _validator(val),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
      color: _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor,
      fontSize: 20);

  InputDecoration buildInputDecoration() => InputDecoration(
      labelText: _labelText,
      labelStyle: TextStyle(
        color: _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor,
      ),
      errorStyle: TextStyle(
          color: StyleTheme.errorTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold));
}
