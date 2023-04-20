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
      final url = Uri.parse('${BaseUrl.baseUrl}/users/${event.userId}/bookBed');
      emit(QueryLoading());
      final token = await getAuthToken();
      try {
        log('before response');
        log(url.toString());
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
          headers: {
            'authorization': 'Bearer $token',
            "Content-Type": "application/json"
          },
          body: json.encode(body),
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

        final listOfPrescription = event.prescriptions;
        emit(QueryLoading());
        final token = await getAuthToken();
        final docId = await getUserID();
        try {
          print('before response');
          print(url.toString());
          print(token.toString());

          final body = {
            "aadhar": event.userId,
            "createdBy": docId,
            "medicinesSuggested": listOfPrescription
          };

          print(jsonEncode(body));
          final response = await http.post(url,
              headers: {
                'authorization': 'Bearer $token'
                // "Content-Type": "application/json"
              },
              body: body);
          final parsed = jsonDecode(response.body);
          if (response.statusCode == 200) {
            emit(QuerySuccess(message: parsed['message']));
          } else {
            emit(QueryFailure(message: parsed['message']));
          }
        } catch (e) {
          print(e.toString());
          emit(QueryFailure(message: e.toString()));
        }
      },
    );

    on<AddMedicalHistoryQueryEvent>(
      (event, emit) async {
        const baseUrl = BaseUrl.baseUrl;

        emit(QueryLoading());
        final token = await getAuthToken();
        final doctorId = await getUserID();
        final doctorName = await getUserName();

        String api = '$baseUrl/doctors/$doctorId/updateMedicalRecord';
        final url = Uri.parse(api);
        print(url);
        try {
          print('before response');
          print(url.toString());
          print(token.toString());

          final body = {
            "userId": event.userId,
            "symptoms": event.symptoms,
            "diagnosis": event.diagnosis,
            "totalFees": event.fees,
            // "aliment": "Medicines",
            "suggestedRemedy": event.remedies,
            "doctorName": doctorName,
          };

          print(jsonEncode(body));
          final response = await http.put(
            url,
            headers: {
              'authorization': 'Bearer $token',
              'Content-Type': 'application/json'
            },
            body: json.encode(body),
          );
          print(response.statusCode);
          final parsed = jsonDecode(response.body);
          if (response.statusCode == 200) {
            emit(QuerySuccess(message: parsed['message']));
          } else {
            emit(QueryFailure(message: parsed['message']));
          }
        } catch (e) {
          print(e.toString());
          emit(QueryFailure(message: e.toString()));
        }
      },
    );
  }
}
