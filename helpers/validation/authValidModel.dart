import 'package:formz/formz.dart';

enum Validation { invalid }

class Email extends FormzInput<String, Validation> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  Validation validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : Validation.invalid;
  }
}

class Password extends FormzInput<String, Validation> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');

  @override
  Validation validator(String value) {
    return _passwordRegExp.hasMatch(value) ? null : Validation.invalid;
  }
}

class Name extends FormzInput<String, Validation> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  static _name(String name) => name.length >= 3 ? true : false;

  @override
  Validation validator(String value) {
    return _name(value) ? null : Validation.invalid;
  }
}
