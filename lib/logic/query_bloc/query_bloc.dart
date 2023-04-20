import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../utils/get_auth_token.dart';

part 'query_event.dart';
part 'query_state.dart';

class QueryBloc extends Bloc<QueryEvent, QueryState> {
  QueryBloc() : super(QueryInitial()) {
    on<QueryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BookBedQueryEvent>((event, emit) async {
      final url =
          Uri.parse('http://localhost:3000/users/${event.userId}/bookBed');
      emit(QueryLoading());
      final token = await getAuthToken();
      try {
        log('before response');
        log(url.toString());
        log(token.toString());
        final body = {
          'hospitalId': event.hospitalId,
          'category': event.category,
          'contact': event.contact,
          'needAmbulance': event.needAmbulance,
          'address': event.address
        };
        log(jsonEncode(body));
        final response = await http.post(
          url,
          headers: {'authorization': 'Bearer $token'},
          body: json.encode({
            'hospitalId': event.hospitalId,
            'category': event.category,
            'contact': event.contact,
            'needAmbulance': event.needAmbulance,
            'address': event.address
          }.toString()),
        );
        log('after response');

        final parsed = jsonDecode(response.body);
        log('Response: $parsed');
        if (response.statusCode == 200) {
          emit(QuerySuccess(message: parsed['message']));
        } else {
          emit(QueryFailure(message: parsed['message']));
        }
      } catch (e) {
        emit(QueryFailure(message: e.toString()));
      }
    });
  }
}
