import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/chemist/uhi_view_prescription.dart';
import 'package:landing_page/design/widgets/uhi_loader.dart';

import '../../../utils/config.dart';
import '../../../utils/get_auth_token.dart';
import 'uhi_view_all_prescription_list.dart';

import 'package:http/http.dart' as http;

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

class UhiChemistAlert extends StatefulWidget {
  final String content1;
  final String title1;
  final Function onPressed;
  var userJson;

  UhiChemistAlert(
      {Key? key,
      required this.content1,
      required this.title1,
      required this.onPressed,
      required this.userJson})
      : super(key: key);

  @override
  State<UhiChemistAlert> createState() => _UhiChemistAlertState();
}

class _UhiChemistAlertState extends State<UhiChemistAlert> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPrescriptions(widget.userJson["id"]),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            var data = snapshot.data;
            return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                title: Text(
                  widget.title1,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.content1),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        widget.onPressed();
                        // Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UhiViewPrescriptionList(
                                userAadhar: widget.userJson["id"],
                                userName: widget.userJson["name"],
                                prescripList: data!["activePrescription"]!),
                          ),
                        );
                      },
                      child: const Text('Active Prescription',
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: const ButtonStyle(alignment: Alignment.center),
                      onPressed: () {
                        // Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UhiViewAllPrescriptionList(
                                userName: widget.userJson["name"],
                                prescripList: data!["passivePrescription"]!),
                          ),
                        );
                      },
                      child: const Text('Previous Prescription',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ));
          }
          return const UhiLoader();
        });
  }
}
