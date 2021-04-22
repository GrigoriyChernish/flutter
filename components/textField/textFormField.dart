import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:formz/formz.dart';

import '../../model/auth/formModel.dart';
import '../../style/MainStyle.dart';

class FormFiledText extends StatefulWidget {
  FormFiledText({
    Key key,
    this.labelText,
    this.keyboardType,
    this.errorText,
  }) : super(key: key);
  final String errorText;
  final String labelText;
  final TextInputType keyboardType;

  @override
  _FormFiledTextState createState() => _FormFiledTextState();
}

class _FormFiledTextState extends State<FormFiledText> {
  FocusNode _focus;
  FocusScopeNode _btnClearFocus;
  FormModel _formModel;
  bool _focused = false;
  bool _isError = false;

  final _changeController = TextEditingController();

  get _focusColor =>
      _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor;

  @override
  void initState() {
    super.initState();
    _formModel = context.read<FormModel>();
    _formModel.key = widget.key;
    _focus = FocusNode();
    _btnClearFocus = FocusScopeNode();
    _focus.addListener(_handleFocusChange);
    _btnClearFocus.addListener(_handleBtnFocusChange);
  }

  @override
  void dispose() {
    _changeController.dispose();
    _focus.dispose();
    _btnClearFocus.dispose();
    super.dispose();
  }

  void _onChanged(val) {
    setState(() {
      _formModel = context.read<FormModel>().emailForm(val, widget.key);
    });
  }

  void _handleBtnFocusChange() {
    if (_btnClearFocus.hasFocus) {
      _focus.nextFocus();
    }
  }

  void _handleFocusChange() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (_focused) {
        if (_formModel?.status == FormzStatus.invalid &&
            _changeController.text.isNotEmpty) {
          _isError = true;
        }
      } else {
        _isError = false;
      }

      if (_focus.hasFocus != _focused) {
        setState(() {
          _focused = _focus.hasFocus;
        });
      }
    });
  }

  String _validator(String val) {
    if (_formModel?.status == FormzStatus.invalid && val.isNotEmpty) {
      return widget.errorText;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: _changeController,
        focusNode: _focus,
        textAlign: TextAlign.center,
        style: buildTextStyle(),
        decoration: buildInputDecoration(),
        onChanged: (val) => _onChanged(val),
        onSaved: (val) {},
        validator: _validator,
        keyboardType: widget.keyboardType,
        obscureText: true,
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
        color: _focusColor,
        fontSize: 20,
      );

  InputDecoration buildInputDecoration() => InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _focusColor,
        ),
        errorText: _isError ? widget.errorText : null,
        errorStyle: TextStyle(
          color: StyleTheme.errorTextColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: _changeController.text.isNotEmpty ? iconClear() : null,
      );

  IconButton iconClear() {
    return IconButton(
        focusNode: _btnClearFocus,
        color: _focusColor,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Icon(Icons.clear),
        onPressed: () {
          _changeController.clear();
        });
  }
}
