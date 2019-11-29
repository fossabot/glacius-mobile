import 'dart:convert';
import 'package:equatable/equatable.dart';

class GeneralError extends Equatable {
  final String message;
  final int statusCode;

  GeneralError({this.message, this.statusCode});

  GeneralError.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        statusCode = json['status_code'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'status_code': statusCode,
      };

  @override
  List<Object> get props => [message, statusCode];

  @override
  String toString() => '$runtimeType ' + jsonEncode(this.toJson());
}
