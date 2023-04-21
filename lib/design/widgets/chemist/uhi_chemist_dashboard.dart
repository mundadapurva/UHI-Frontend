import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/chemist/uhi_qr_scan_chemist.dart';
import 'package:landing_page/design/widgets/uhi_qr_scanner.dart';

class UhiChemistDashboard extends StatelessWidget {
  const UhiChemistDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello, Purva Mundada',
          style: TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),
        centerTitle: true,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 21,
            backgroundImage: AssetImage('assets/images/Avatar.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    const Text(
                      "Scan QR code to check-in the patient's prescription",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 20),
                    const UhiQRScannerChemist(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
