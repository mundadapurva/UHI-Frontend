import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_qr_scanner.dart';
import 'package:http/http.dart' as http;

import '../../utils/config.dart';
import '../../utils/get_auth_token.dart';

Future<List> fetchAppointments() async {
  final doctorId = await getUserID();
  final token = await getAuthToken();

  final url = Uri.parse('${BaseUrl.baseUrl}/doctors/$doctorId/getAppointments');
  print(url);
  final header = {
    'authorization': 'Bearer $token',
    // "Content-Type": "application/json"
  };

  final response = await http.get(url, headers: header);
  print(response.body);
  print(response.statusCode);
  final parsed = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return parsed;
  } else {
    throw Exception('Failed to load appointments');
  }
}

class UhiDoctorDashboard extends StatefulWidget {
  UhiDoctorDashboard({super.key});

  @override
  State<UhiDoctorDashboard> createState() => _UhiDoctorDashboardState();
}

class _UhiDoctorDashboardState extends State<UhiDoctorDashboard> {
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getDetails() async {
    name = await getUserName().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name == "" ? "User" : name,
          style: const TextStyle(
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
            backgroundImage: AssetImage('assets/images/Avatar.png'),
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
              child: const Column(
                children: [
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
            FutureBuilder(
                future: fetchAppointments(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  // [{"_id":"64416e136fd7be00fe1b78c2","userId":"643790c21ec664001ee8f25b","doctorId":"1313131314","appointmentTime":"2017-10-14T12:41:34.000Z","status":"pending","created_date":"2023-04-20T16:53:39.264Z","__v":0},
                  // {"_id":"6441717ea964f801793c2255",
                  // "userId":"643790c21ec664001ee8f25b",
                  // "doctorId":"1313131314",
                  // "appointmentTime":"2017-10-14T12:41:34.000Z",
                  // "userName":"Prabhat",
                  // "status":"pending",
                  // "created_date":"2023-04-20T17:08:14.664Z",
                  // "__v":0}]
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    print(data);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return data.length == 0
                            ? Text('No appoints')
                            : Card(
                                elevation: 4,
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: 80,
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                data[index]['userName'] ??
                                                    'patient name',
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w900)),
                                            Text(
                                              "📆 " +
                                                  data[index]['appointmentTime']
                                                      .toString()
                                                      .split('T')[0] +
                                                  "\n\n" +
                                                  "🕛 " +
                                                  data[index]['appointmentTime']
                                                      .toString()
                                                      .split('T')[1]
                                                      .split('.')[0],
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
