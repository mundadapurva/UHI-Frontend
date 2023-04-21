import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/chemist/uhi_chemist_alert.dart';
import 'package:landing_page/design/widgets/uhi_doctor_alert.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class UhiQRScannerChemist extends StatefulWidget {
  const UhiQRScannerChemist({super.key});

  @override
  State<UhiQRScannerChemist> createState() => _UhiQRScannerChemistState();
}

class _UhiQRScannerChemistState extends State<UhiQRScannerChemist> {
  String result = "Scan a QR code";
  Future _Scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('Oh snap, nothing was scanned!');
    } else {
      setState(() => result = barcode);
      final userJson = barcode;
      showDialog(
        context: context,
        builder: (context) => UhiChemistAlert(
          title1: 'Patient Details',
          content1: "Tag or View Patient's Prescription",
          onPressed: () {
            log('Tag or View Patient\'s Prescription');
          },
          userJson: json.decode(userJson)
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   result,
            //   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            // ), // scanned result will be shown
            // Expanded(child: Column()),
            // const SizedBox(
            //   height: 10,
            // ),
            ElevatedButton(
              onPressed: () {
                _Scan();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('Scan QR', style: TextStyle(fontSize: 17)),
            )
          ],
        ),
      ),
    );
  }
}
