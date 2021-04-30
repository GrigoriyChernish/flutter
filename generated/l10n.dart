// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static late S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Привет и пока`
  String get title {
    return Intl.message(
      'Привет и пока',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать`
  String get subtitle {
    return Intl.message(
      'Добро пожаловать',
      name: 'subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get registerTitle {
    return Intl.message(
      'Зарегистрироваться',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get loginTitle {
    return Intl.message(
      'Логин',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Электронная почта`
  String get email {
    return Intl.message(
      'Электронная почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить пароль`
  String get confirmPassword {
    return Intl.message(
      'Подтвердить пароль',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Имя пользователя`
  String get name {
    return Intl.message(
      'Имя пользователя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Запомнить`
  String get remember {
    return Intl.message(
      'Запомнить',
      name: 'remember',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get btnOk {
    return Intl.message(
      'Войти',
      name: 'btnOk',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get btnForgotPassword {
    return Intl.message(
      'Отправить',
      name: 'btnForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get btnRegistre {
    return Intl.message(
      'Зарегистрироваться',
      name: 'btnRegistre',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get logout {
    return Intl.message(
      'Выход',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль?`
  String get forgotPassword {
    return Intl.message(
      'Забыли пароль?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить пароль`
  String get forgotPasswordTitle {
    return Intl.message(
      'Восстановить пароль',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPasswordTitle {
    return Intl.message(
      'Новый пароль',
      name: 'newPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Обновить`
  String get btnNewPassword {
    return Intl.message(
      'Обновить',
      name: 'btnNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Используйте не менее 3 символов`
  String get errorInputName {
    return Intl.message(
      'Используйте не менее 3 символов',
      name: 'errorInputName',
      desc: '',
      args: [],
    );
  }

  /// `Проверить адрес электронной почты`
  String get errorInputEmail {
    return Intl.message(
      'Проверить адрес электронной почты',
      name: 'errorInputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Используйте не менее 4 символов`
  String get errorInputPassword {
    return Intl.message(
      'Используйте не менее 4 символов',
      name: 'errorInputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте свой пароль`
  String get errorInputConfirmPassword {
    return Intl.message(
      'Проверьте свой пароль',
      name: 'errorInputConfirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}