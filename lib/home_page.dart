import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_book_appointment.dart';
import 'package:landing_page/design/widgets/uhi_doctor_dashboard.dart';
import 'package:landing_page/design/widgets/uhi_qr_scanner.dart';

import 'design/widgets/uhi_bottom_navbar.dart';

import 'design/widgets/uhi_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Unified Healthcare Interface',
    //         style: TextStyle(fontSize: 14)),
    //     centerTitle: true,
    //     elevation: 8,
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //         bottom: Radius.circular(10),
    //       ),
    //     ),
    //     // leading: const Icon(Icons.menu),
    //     actions: const [
    //       CircleAvatar(
    //         radius: 21,
    //         backgroundImage: AssetImage('assets/images/Avatar.png'),
    //       ),
    //       SizedBox(width: 10),
    //     ],
    //   ),
    //   drawer: const UhiDrawer(),
    //   // body: SingleChildScrollView(
    //   //   child: Column(
    //   //     children: [
    //   //       const UhiCarousel(),
    //   //       UhiNewsList(),
    //   //     ],
    //   //   ),
    //   // ),
    //   body: const UhiBookAppointment(),
    //   bottomNavigationBar: const UhiBottomNavbar(),
    // );
    return UhiDoctorDashboard();
  }
}
