import 'package:flutter/material.dart';

enum NotifyStatus { success, info, error }
enum NotifyImportance { normal }

class Notify with ChangeNotifier {
  String message = '';
  NotifyStatus status = NotifyStatus.info;
  NotifyImportance importance = NotifyImportance.normal;

  Notify.init(this.message, this.status);
  factory Notify() {
    return Notify.init('', NotifyStatus.info);
  }

  void setNotify(message, status) {
    this.copyWith(message: message, status: status);
    notifyListeners();
  }

  Notify copyWith({message, status}) {
    this.message = message ?? this.message;
    this.status = status ?? this.status;
    return Notify.init(message, status);
  }
}
