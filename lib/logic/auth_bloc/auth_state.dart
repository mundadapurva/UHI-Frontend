// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  final String id;

  AuthSuccess({
    required this.message,
    required this.id,
  });
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}

