import 'dart:developer';

import 'package:flutter/material.dart';
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
      log(barcode);
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
            Text(
              result,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ), // scanned result will be shown
            // Expanded(child: Column()),
            const SizedBox(
              height: 15,
            ),
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
              child: const Text('SCAN QR'),
            )
          ],
        ),
      ),
    );
  }
}
