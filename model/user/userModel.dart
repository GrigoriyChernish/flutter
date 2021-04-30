import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final int? id;
  final String? name;
  final String? email;
  final String? avatar;
  final String? verified;
  final String? provider;
  final String? providerId;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.verified,
      this.provider,
      this.providerId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      verified: json['email_verified_at'],
      provider: json['provider'],
      providerId: json['provider_id'],
    );
  }
}
