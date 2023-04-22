import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';
import 'package:http/http.dart' as http;

Future<List> getMedicalRecord(String id) async {
  final url = Uri.parse('${BaseUrl.baseUrl}/users/$id/getMedicalHistory');

  final token = await getAuthToken();
  log(url.toString());
  final header = {'authorization': 'Bearer $token'};

  final response = await http.get(url, headers: header);

  final parsed = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return parsed["medicalHistory"];
  } else {
    throw Exception('Failed to load chemists');
  }
}

class UhiMedicalHistoryList extends StatelessWidget {
  const UhiMedicalHistoryList({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getMedicalRecord(userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final results = snapshot.data!;
          if (results.isEmpty) {
            return const Center(
              child: Text(
                'No medical history found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, i) {
                return Card(
                elevation: 4,
                child: Container(
                  // height: 230,
                  width: double.infinity,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.07,
                            0.08
                          ],
                          colors: [
                            Color.fromARGB(255, 91, 213, 238),
                            Colors.white
                          ],),),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital_rounded,
                              size: 40,
                            ),
                            Text(
                              'Dr. \t${results[i]["doctorName"]}',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 91, 213, 238),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_sharp,
                              size: 40,
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
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              'Symptoms: ${results[i]["symptoms"]}',
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              'Diagnosis: ' + results[i]["diagnosis"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
                      ],
                    ),
                  ),
                ),
              );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
