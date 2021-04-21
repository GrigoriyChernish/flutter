import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:formz/formz.dart';

import '../../model/auth/loginFormModel.dart';
import '../../style/MainStyle.dart';

class FormFiledText extends StatefulWidget {
  FormFiledText({
    Key key,
    this.labelText,
    this.keyboardType,
  }) : super(key: key);

  final String labelText;
  final TextInputType keyboardType;

  @override
  _FormFiledTextState createState() => _FormFiledTextState();
}

class _FormFiledTextState extends State<FormFiledText> {
  FocusNode _focus;
  bool _focused = false;
  LoginFormModel _loginFormModel;
  final _changeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginFormModel = context.read<LoginFormModel>();
    _focus = FocusNode();
    _focus.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _changeController.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _onChanged(val) {
    setState(() {
      _loginFormModel =
          context.read<LoginFormModel>().emailForm(val, widget.key);
    });

    //print(context.read<LoginFormModel>().email);
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
    // final LoginFormModel loginFormModel = Provider.of<LoginFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _changeController,
        focusNode: _focus,
        textAlign: TextAlign.center,
        style: buildTextStyle(),
        decoration: buildInputDecoration(),
        onChanged: (val) => _onChanged(val),
        onSaved: (val) {},
        validator: (val) {
          if (_loginFormModel?.status == FormzStatus.invalid &&
              val.isNotEmpty) {
            return 'Please enter some text';
          } else if (!_focused && val.isEmpty) {
            print(_changeController.text);
            return 'ведите чтото';
          }
          return null;
        },
        keyboardType: widget.keyboardType,
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
      color: _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor,
      fontSize: 20);

  InputDecoration buildInputDecoration() => InputDecoration(
      labelText: widget.labelText,
      labelStyle: TextStyle(
        color: _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor,
      ),
      errorStyle: TextStyle(
          color: StyleTheme.errorTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold));
}
