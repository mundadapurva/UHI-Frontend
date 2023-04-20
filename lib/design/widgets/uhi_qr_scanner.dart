import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_doctor_alert.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class UhiQRScanner extends StatefulWidget {
  const UhiQRScanner({super.key});

  @override
  State<UhiQRScanner> createState() => _UhiQRScannerState();
}

class _UhiQRScannerState extends State<UhiQRScanner> {
  String result = "Scan a QR code";
  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('Oh snap, nothing was scanned!');
    } else {
      setState(() => result = barcode);
      showDialog(
        context: context,
        builder: (context) => UhiDoctorAlert(
          title: 'Patient Details',
          content: "Add or View Patient's Medical Details",
          onPressed: () {
            log('Add or View Patient\'s Medical Details');
          },
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
                _scan();
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
