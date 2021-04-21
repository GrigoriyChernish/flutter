import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

/// {@template LoginFormModel}
/// LoginFormModel model
///
/// [LoginFormModel.empty] represents an unauthenticated user.
/// {@endtemplate}

enum LoginFormKey {
  emailInput,
}

// ignore: must_be_immutable
class LoginFormModel extends Equatable with ChangeNotifier {
  /// {@macro user}
  LoginFormModel({
    this.email = const EmailValidation.pure(),
    this.status = FormzStatus.pure,
    this.password = const Password.pure(),
  });

  FormzStatus status;
  EmailValidation email;
  Password password;

  emailForm(data, Key key) {
    switch (key) {
      case const Key("emailInput"):
        final emails = EmailValidation.dirty(data);
        return this.copyWith(
          email: emails,
          status: Formz.validate([emails]),
        );

        break;

      case const Key("passwordInput"):
        final passwords = Password.dirty(data);
        return this.copyWith(
          password: passwords,
          status: Formz.validate([passwords]),
        );
    }
    notifyListeners();
  }

  getFormModel(model) {
    notifyListeners();
    return model;
  }

  @override
  List<Object> get props => [email];

  LoginFormModel copyWith({
    EmailValidation email,
    FormzStatus status,
    Password password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.status = status ?? this.status;
    return LoginFormModel(
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
