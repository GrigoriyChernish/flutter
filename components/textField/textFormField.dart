import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:formz/formz.dart';

import '../../model/auth/formModel.dart';
import '../../style/MainStyle.dart';

class FormFiledText extends StatefulWidget {
  FormFiledText({
    Key? key,
    this.text = '',
    this.id,
    this.labelText,
    this.keyboardType,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);
  final bool obscureText;
  final String? errorText;
  final String? labelText;
  final String? text;
  final TextInputType? keyboardType;
  final FormKey? id;

  @override
  _FormFiledTextState createState() => _FormFiledTextState();
}

class _FormFiledTextState extends State<FormFiledText> {
  FocusNode? _focus;
  FocusScopeNode? _btnClearFocus;
  late FormzStatus _status = FormzStatus.invalid;
  bool _focused = false;
  bool _isError = false;
  bool _obscureText = false;
  bool _visibility = false;

  final _changeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _btnClearFocus = FocusScopeNode();
    _focus!.addListener(_handleFocusChange);
    _btnClearFocus!.addListener(_handleBtnFocusChange);
    _changeController.text = widget.text!;
    if (_changeController.text.isNotEmpty) {
      _onChanged(_changeController.text);
    }
    if (widget.obscureText) {
      _obscureText = true;
      _visibility = true;
    }
  }

  @override
  void dispose() {
    _changeController.dispose();
    _focus!.dispose();
    _btnClearFocus!.dispose();
    super.dispose();
  }

  void _onChanged(val) {
    setState(() {
      _status = context.read<FormModel>().formValidate(val, widget.id);
    });
  }

  void _handleBtnFocusChange() {
    if (_btnClearFocus!.hasFocus) {
      _focus!.nextFocus();
    }
  }

  void _handleFocusChange() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_focused) {
        if (_status.isInvalid && _changeController.text.isNotEmpty) {
          _isError = true;
        }
      } else {
        _isError = false;
      }

      if (_focus!.hasFocus != _focused) {
        setState(() {
          _focused = _focus!.hasFocus;
        });
      }
    });
  }

  String? _validator(String? val) {
    if (_status.isInvalid && !_focused || val!.isEmpty) {
      _isError = true;
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
        obscureText: _visibility,
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
        suffixIcon: _obscureText ? iconVisibility : controllerIconClear,
      );

  get controllerIconClear => _changeController.text.isNotEmpty ? iconClear() : null;

  get _focusColor => _focused ? StyleTheme.focusColor : StyleTheme.primaryTextColor;

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

  IconButton get iconVisibility => IconButton(
        focusNode: _btnClearFocus,
        color: _focusColor,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Icon(_visibility ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => _visibility = !_visibility),
      );
}
