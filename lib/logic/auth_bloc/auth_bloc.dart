import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/config.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthRegisterEvent>((event, emit) async {
      final url = Uri.parse('${BaseUrl.baseUrl}/users');

      emit(AuthLoading());
      try {
        // await Future.delayed(const Duration(seconds: 4));
        final response = await http.post(url, body: {
          'aadhar': event.aadhar,
          'firstName': event.name,
          'dob': event.dob,
          'phone': event.phone,
          'address': event.address,
          'email': event.email,
          'password': event.password,
        });
        final parsed = await jsonDecode(response.body) as Map<String, dynamic>;
        log(parsed.toString());
        log(parsed['userId']);
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('id', parsed['userId']);
        if (response.statusCode == 200) {
          emit(AuthSuccess(
            message: "Registration successful",
            id: parsed['userId'],
            type: 'user',
          ));
        } else {
          emit(AuthFailure(message: 'Registration failed'));
        }
      } catch (e) {
        emit(AuthFailure(message: 'Registration failed'));
      }
    });

    on<AuthRegisterDoctorEvent>(
      ((event, emit) async {
        final url = Uri.parse('${BaseUrl.baseUrl}/doctors');

        emit(AuthLoading());
        try {
          // await Future.delayed(const Duration(seconds: 4));

          final response = await http.post(url, body: {
            'doctorLicId': event.license,
            'firstName': event.name,
            'phone': event.phone,
            'address': event.address,
            'email': event.email,
            'password': event.password,
            'specialization': event.specialization,
            'hospital': event.hospital,
            'qualification': event.qualification,
          });
          log(response.body);
          final parsed =
              await jsonDecode(response.body) as Map<String, dynamic>;
          log(parsed.toString());
          final id = parsed['doctorLicId'];

          final SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('id', id);
          if (response.statusCode == 200) {
            emit(AuthSuccess(
                id: id, message: parsed['message'], type: 'doctor'));
          } else {
            emit(AuthFailure(message: 'Registration failed'));
          }
        } catch (e) {
          log(e.toString());
          emit(AuthFailure(message: 'Registration failed'));
        }
      }),
    );

    on<AuthRegisterChemistEvent>(
      (event, emit) async {
        final url = Uri.parse('${BaseUrl.baseUrl}/chemist');

        emit(AuthLoading());
        try {
          // await Future.delayed(const Duration(seconds: 4));
          final jsonData = {
            'shopname': event.shopName,
            'address': event.shopAddress,
          };

          final response = await http.post(url, body: {
            'chemistId': event.license,
            'firstName': event.name,
            'phone': event.phone,
            'email': event.email,
            'password': event.password,
            'shopDetails': jsonData
          });
          // log(response.body);
          final parsed = jsonDecode(response.body) as Map<String, dynamic>;
          // log(parsed.toString());
          final id = parsed['chemistId'];

          final SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('id', id);
          if (response.statusCode == 200) {
            emit(AuthSuccess(
                id: id, message: parsed['message'], type: 'chemist'));
          } else {
            emit(AuthFailure(message: 'Registration failed'));
          }
        } catch (e) {
          log(e.toString());
          emit(AuthFailure(message: e.toString()));
        }
      },
    );

    on<AuthLoginEvent>(
      (event, emit) async {
        final Uri url;
        if (event.type == 'user') {
          url = Uri.parse('${BaseUrl.baseUrl}/users/login');
        } else if (event.type == 'doctor') {
          url = Uri.parse('${BaseUrl.baseUrl}/doctors/login');
        } else {
          url = Uri.parse('${BaseUrl.baseUrl}/chemist/login');
        }

        emit(AuthLoading());

        try {
          final http.Response response;
          if (event.type == 'user') {
            response = await http.post(
              url,
              body: {'aadhar': event.id, 'password': event.password},
            );
          } else if (event.type == 'doctor') {
            response = await http.post(
              url,
              body: {'doctorLicId': event.id, 'password': event.password},
            );
          } else {
            response = await http.post(
              url,
              body: {'chemistId': event.id, 'password': event.password},
            );
          }
          final parsed = jsonDecode(response.body) as Map<String, dynamic>;
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('accessToken', parsed['accessToken']);
          if (response.statusCode == 200) {
            emit(
              AuthSuccess(
                id: parsed['accessToken'],
                message: parsed['message'],
              ),
            );
          } else {
            emit(
              AuthFailure(message: 'Login failed'),
            );
          }
        } catch (e) {
          log(e.toString());
          emit(
            AuthFailure(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
