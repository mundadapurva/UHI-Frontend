import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';
import 'package:http/http.dart' as http;

Future<List> getMedicalRecord() async {
  final id = await getUserID();
  final url = Uri.parse('${BaseUrl.baseUrl}/users/$id/getMedicalHistory');

  final token = await getAuthToken();
  log(url.toString());
  final header = {'authorization': 'Bearer $token'};

  final response = await http.get(url, headers: header);

  final parsed = jsonDecode(response.body);

  // final parse2 = jsonDecode(parsed["medicalHistory"]);

  // log('Response: $parse2');

  if (response.statusCode == 200) {
    return parsed["medicalHistory"];
  } else {
    throw Exception('Failed to load chemists');
  }
}

class UhiMedicalHistoryList extends StatelessWidget {
  const UhiMedicalHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getMedicalRecord(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!;

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 4,
                child: Container(
                  height: 230,
                  width: double.infinity,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doctors: \n\t\t\t\t ${results[i]["doctorName"]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Symptoms: \n\t\t\t\t ${results[i]["symptoms"]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Diagnosis: ' + results[i]["diagnosis"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Fees: ${results[i]["totalFees"]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Home remedies: ${results[i]["suggestedRemedy"]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Date: ${results[i]["createdOn"].split("T")[0]}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
