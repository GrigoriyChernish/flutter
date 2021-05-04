import 'package:flutter/material.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class Authentication with ChangeNotifier {
  AuthStatus status;

  Authentication({
    this.status = AuthStatus.unauthenticated,
  });

  set(AuthStatus status) {
    this.copyWith(status: status);
    notifyListeners();
  }

  Authentication copyWith({AuthStatus? status}) {
    this.status = status ?? AuthStatus.unauthenticated;
    return Authentication(status: status ?? AuthStatus.unauthenticated);
  }

  List<Object> get props => [status];
}
