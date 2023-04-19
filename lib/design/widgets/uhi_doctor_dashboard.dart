import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_qr_scanner.dart';

class UhiDoctorDashboard extends StatelessWidget {
  UhiDoctorDashboard({super.key});
  List<int> appointment = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> patient = [
    'Patient 1',
    'Patient 2',
    'Patient 3',
    'Patient 4',
    'Patient 5',
    'Patient 6',
    'Patient 7',
    'Patient 8',
    'Patient 9',
    'Patient 10',
  ];
  List<String> time = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello, Dr. Atharv Bhadange',
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
        leading: const Icon(Icons.calendar_month),
        actions: const [
          CircleAvatar(
            radius: 21,
            backgroundImage: NetworkImage(
                'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: const [
                  Text(
                    'Scan QR code to check-in your patient',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  UhiQRScanner(),
                  SizedBox(height: 20),
                  Text(
                    'Your appointments for today',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            for (var i = 0; i < 8; i++)
              Card(
                elevation: 4,
                child: SingleChildScrollView(
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(patient[i],
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              time[i],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
