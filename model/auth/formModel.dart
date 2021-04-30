import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../helpers/validation/authValidModel.dart';

enum FormKey { email, password, confirm, name }

class FormModel with ChangeNotifier {
  FormKey? key;
  late FormzStatus status;
  Name name;
  Email email;
  Password password;
  Password confirm;

  FormModel({
    this.key,
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirm = const Password.pure(),
  });

  _email(String data) {
    final email = Email.dirty(data);
    this.copyWith(email: email);
    return Formz.validate([email]);
  }

  _name(String data) {
    final name = Name.dirty(data);
    this.copyWith(name: name);
    return Formz.validate([name]);
  }

  _password(String data) {
    final passwords = Password.dirty(data);
    this.copyWith(password: passwords);
    return Formz.validate([passwords]);
  }

  _confirm(String data) {
    if (data == this.password.value) {
      final confirm = Password.dirty(data);
      this.copyWith(confirm: confirm);
      return Formz.validate([confirm]);
    } else {
      return FormzStatus.invalid;
    }
  }

  formValidate(String data, FormKey? key) {
    switch (key!) {
      case FormKey.email:
        return _email(data);
      case FormKey.name:
        return _name(data);
      case FormKey.password:
        return _password(data);
      case FormKey.confirm:
        return _confirm(data);
    }
  }

  validate(List valid) {
    return Formz.validate([...valid as Iterable<FormzInput<dynamic, dynamic>>]);
  }

  FormModel copyWith({
    Name? name,
    Email? email,
    FormzStatus? status,
    Password? password,
    Password? confirm,
    FormKey? key,
  }) {
    this.key = key ?? this.key;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirm = confirm ?? this.confirm;

    return FormModel(
      key: key ?? this.key,
      password: password ?? this.password,
      email: email ?? this.email,
      name: name ?? this.name,
      confirm: confirm ?? this.confirm,
    );
  }

  bool get isValid => status.isValid;

  Map<String, String> register() => {
        'email': email.value,
        'password': password.value,
        'name': name.value,
      };
  Map<String, String> login() => {
        'email': email.value,
        'password': password.value,
      };

  Map<String, String> confirmPassword() => {
        'email': email.value,
      };
}
