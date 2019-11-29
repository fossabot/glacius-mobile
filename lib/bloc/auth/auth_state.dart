import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:glacius_mobile/models/models.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
