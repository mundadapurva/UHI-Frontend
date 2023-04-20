import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:landing_page/design/widgets/uhi_add_prescription.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../utils/config.dart';
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

    on<AddPrescriptionQueryEvent>(
      (event, emit) async {
        const baseUrl = BaseUrl.baseUrl;
        const api = '$baseUrl/doctors/addPrescription';
        final url = Uri.parse(api);

        final list = event.prescriptions;
        emit(QueryLoading());
        final token = await getAuthToken();
        final docId = await getUserID();
        try {
          log('before response');
          log(url.toString());
          log(token.toString());

          final body = {
            "aadhar": event.userId,
            "createdBy": docId,
            "medicinesSuggested": [
              {
                "name": "cccccccccc",
                "price": "84",
                "timeToConsume": "111",
                "qty": "1"
              },
              {
                "name": "ddddddddddd",
                "price": "100",
                "timeToConsume": "100",
                "qty": "10"
              }
            ]
          };
        } catch (e) {
          emit(QueryFailure(message: e.toString()));
        }
      },
    );
  }
}
