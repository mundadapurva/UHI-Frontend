import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:landing_page/design/widgets/uhi_book_appointment.dart';
import 'package:landing_page/design/widgets/uhi_carousel.dart';
import 'package:landing_page/design/widgets/uhi_doctor_dashboard.dart';
import 'package:landing_page/design/widgets/uhi_news_list.dart';

import 'package:landing_page/design/widgets/uhi_qr_generator.dart';
import 'package:landing_page/design/widgets/uhi_qr_scanner.dart';
import 'package:landing_page/utils/get_auth_token.dart';

import 'design/widgets/uhi_bottom_navbar.dart';

import 'design/widgets/uhi_drawer.dart';
import 'utils/config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unified Healthcare Interface',
            style: TextStyle(fontSize: 14)),
        centerTitle: true,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        // leading: const Icon(Icons.menu),
        actions: [
          GestureDetector(
            child: const CircleAvatar(
              radius: 21,
              backgroundImage: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png'),
            ),
            onTap: () async {
              final id = await getUserID();
              final token = await getAuthToken();

              final headers = {
                'authorization': 'Bearer $token',
              };

              final response = await http.get(
                Uri.parse('${BaseUrl.baseUrl}/users/$id'),
                headers: headers,
              );

              log('${BaseUrl.baseUrl}/users/$id');

              final parsed = jsonDecode(response.body);
              log(parsed.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UhiQRGenerator(
                    id: id!,
                    name: parsed['firstName'],
                    email: parsed['email'],
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: const UhiDrawer(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const UhiCarousel(),
      //       UhiNewsList(),
      //     ],
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UhiCarousel(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Health News: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 10),
          UhiNewsList(),
        ],
      ),
      // bottomNavigationBar: const UhiBottomNavbar(),
    );
    // return UhiDoctorDashboard();
  }
}
