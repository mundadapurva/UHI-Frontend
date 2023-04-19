// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String aadhar;
  final String name;
  final String phone;
  final String address;
  final String dob;

  AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.aadhar,
    required this.name,
    required this.phone,
    required this.address,
    required this.dob,
  });
}

class AuthRegisterDoctorEvent extends AuthEvent {
  final String email;
  final String password;
  final String license;
  final String name;
  final String phone;
  final String address;
  final String specialization;
  final String hospital;
  final String qualification;

  AuthRegisterDoctorEvent({
    required this.email,
    required this.password,
    required this.license,
    required this.name,
    required this.phone,
    required this.address,
    required this.specialization,
    required this.hospital,
    required this.qualification,
  });
}

class AuthLogoutEvent extends AuthEvent {}
