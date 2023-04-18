import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<AuthRegisterEvent>((event, emit) async {
      final url = Uri.parse('http://localhost:3000/users');

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
        log(response.body);
        final parsed = await jsonDecode(response.body) as Map<String, dynamic>;
        log(parsed.toString());
        log(parsed['userId']);
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('id', parsed['userId']);
        if (response.statusCode == 200) {
          emit(AuthSuccess(message: "Registration successful", userId: parsed['userId']));
        } else {
          emit(AuthFailure(message: 'Registration failed'));
        }
      } catch (e) {
        emit(AuthFailure(message: 'Registration failed'));
      }
    });

    
  }
}
