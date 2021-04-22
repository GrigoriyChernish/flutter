import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum LoginFormKey { email, password }

class FormModel with ChangeNotifier {
  FormModel({
    this.key,
    this.email = const EmailValidation.pure(),
    this.status = FormzStatus.pure,
    this.password = const Password.pure(),
  });

  FormzStatus status;
  EmailValidation email;
  Password password;
  Key key;

  emailForm(data, Key key) {
    if (key == const Key("email")) {
      final emails = EmailValidation.dirty(data);
      return this.copyWith(
        key: key,
        email: emails,
        status: Formz.validate([emails]),
      );
    }

    if (key == const Key("password")) {
      final passwords = Password.dirty(data);
      return this.copyWith(
        key: key,
        password: passwords,
        status: Formz.validate([passwords]),
      );
    }
    notifyListeners();
  }

  FormModel copyWith({
    EmailValidation email,
    FormzStatus status,
    Password password,
    Key key,
  }) {
    this.key = key ?? this.key;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.status = status ?? this.status;

    return FormModel(
      key: this.key,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

enum EmailValidationError { invalid }

class EmailValidation extends FormzInput<String, EmailValidationError> {
  const EmailValidation.pure() : super.pure('');

  const EmailValidation.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
