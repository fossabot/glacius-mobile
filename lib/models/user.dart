import 'dart:convert';
import 'package:glacius_mobile/models/base_model.dart';

class User extends BaseModel {
  final String name;
  final String email;
  final String emailVerifiedAt;

  User({
    int id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object> get props => super.props
    ..addAll([
      name,
      email,
      emailVerifiedAt,
    ]);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        emailVerifiedAt = json['email_verify_at'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
    });

  @override
  String toString() => '$runtimeType ' + jsonEncode(this.toJson());
}
