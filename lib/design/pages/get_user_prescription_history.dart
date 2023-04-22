import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';

import 'package:http/http.dart' as http;

import '../widgets/chemist/uhi_view_prescription.dart';
import '../widgets/uhi_loader.dart';

Future fetchPrescriptions(String aadhar) async {
  // final aadhar = aadhar;
  final token = await getAuthToken();

  final url = Uri.parse('${BaseUrl.baseUrl}/chemist/$aadhar/get-prescription');
  print(url);
  final header = {
    'authorization': 'Bearer $token',
    "Content-Type": "application/json"
  };

  final response = await http.get(url, headers: header);
  print(response.body);
  print(response.statusCode);
  final parsed = json.decode(response.body);
  if (response.statusCode == 200) {
    print('this is pared data: ');
    print(parsed);
    return parsed;
  } else {
    throw Exception('Failed to load appointments');
  }
}

class UhiUserPrescriptionHistory extends StatelessWidget {
  const UhiUserPrescriptionHistory({super.key, required this.userJson});
  final userJson;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPrescriptions(userJson['id']),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          log(snapshot.data['activePrescription'].toString());

          List prescripList = snapshot.data["activePrescription"] +
              snapshot.data["passivePrescription"];
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Prescription History',
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            body: Container(
              color: Colors.white,
              height: double.infinity,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: prescripList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, pre) {
                    return Card(
                      elevation: 4,
                      child: Container(
                        // height: 180,
                        width: double.infinity,
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/Prescription.png',
                                    height: 30, width: 30),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Patient name: ${userJson['name']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: prescripList[pre]
                                        ["medicinesSuggested"]
                                    .length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Drug name: ${prescripList[pre]["medicinesSuggested"][index]["name"]}',
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Quantity: ${prescripList[pre]["medicinesSuggested"][index]["qty"]}',
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Dosage: ${dosageCovertor(prescripList[pre]["medicinesSuggested"][index]["timeToConsume"])}',
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Divider(
                                        height: 55,
                                        thickness: 1.6,
                                        color: Colors.grey,
                                      )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else {
          return const UhiLoader();
        }
      },
    );
  }
}
