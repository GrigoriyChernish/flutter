import 'package:flutter/material.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class Authentication with ChangeNotifier {
  AuthStatus status;

  Authentication({
    this.status = AuthStatus.unknown,
  });

  set(AuthStatus status) {
    this.copyWith(status: status);
    notifyListeners();
  }

  Authentication copyWith({AuthStatus? status}) {
    this.status = status ?? AuthStatus.unknown;
    return Authentication(status: status ?? AuthStatus.unknown);
  }

/*   const Authentication._({
    this.status = AuthStatus.unknown,
  });

  const Authentication.unknown() : this._();

  const Authentication.authenticated()
      : this._(status: AuthStatus.authenticated);

  const Authentication.unauthenticated()
      : this._(status: AuthStatus.unauthenticated); */

  List<Object> get props => [status];
}
