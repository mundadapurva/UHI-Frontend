import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_add_prescription.dart';

class UhiDoctorAlert extends StatelessWidget {
  final String content;
  final String title;
  final Function onPressed;

  const UhiDoctorAlert({
    Key? key,
    required this.content,
    required this.title,
    required this.onPressed,
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
                Navigator.of(context).pop();
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
                    builder: (context) => const UhiAddPrescription(
                      userId: '',
                      userName: '',
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
