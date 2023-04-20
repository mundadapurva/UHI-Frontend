// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:landing_page/design/widgets/uhi_add_prescription.dart';

import '../pages/uhi_add_medical_history.dart';

class UhiDoctorAlert extends StatelessWidget {
  final String content;
  final String title;
  final Function onPressed;
  var userJson;

  UhiDoctorAlert({
    Key? key,
    required this.content,
    required this.title,
    required this.onPressed,
    required this.userJson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(content),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(alignment: Alignment.center),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UhiAddMedicalHistory(
                        userId: userJson["id"],
                      ),
                    ));
              },
              child: const Text('Add/View Medical History',
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onPressed();
                // Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UhiAddPrescription(
                      userId: userJson["id"],
                      userName: userJson["name"],
                    ),
                  ),
                );
              },
              child:
                  const Text('Add Prescription', textAlign: TextAlign.center),
            ),
          ],
        ));
  }
}
