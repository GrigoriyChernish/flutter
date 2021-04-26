import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../helpers/validation/authValidModel.dart';

enum FormKey { email, password, confirm, name }

class FormModel with ChangeNotifier {
  FormKey key;
  FormzStatus status;
  Name name;
  Email email;
  Password password;
  Password confirm;

  FormModel({
    this.key,
    //this.status = FormzStatus.invalid,
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

  formValidate(String data, FormKey key) {
    switch (key) {
      case FormKey.email:
        return _email(data);
        break;
      case FormKey.name:
        return _name(data);
        break;
      case FormKey.password:
        return _password(data);
        break;
      case FormKey.confirm:
        return _confirm(data);
        break;
    }

    notifyListeners();
  }

  validate(List valid) {
    return Formz.validate([...valid]);
  }

  FormModel copyWith({
    Name name,
    Email email,
    FormzStatus status,
    Password password,
    Password confirm,
    FormKey key,
  }) {
    this.key = key ?? this.key;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirm = confirm ?? this.confirm;
    //this.status =
    //   Formz.validate([this.email, this.name, this.password, this.confirm]);

    return FormModel(
      key: key ?? this.key,
      //status: status ?? this.status,
      password: password ?? this.password,
      email: email ?? this.email,
      name: name ?? this.name,
      confirm: confirm ?? this.confirm,
    );
  }

  bool get isValid => status.isValid;

  List<Object> get all => [email.value, password.value, name.value];

  Map<String, dynamic> toJson() => {
        'email': email.value,
        'password': password.value,
        'name': name.value,
      };
}
