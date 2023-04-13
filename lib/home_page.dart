import 'package:flutter/material.dart';

import 'design/widgets/uhi_bottom_navbar.dart';

import 'design/widgets/uhi_patient_register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        leading: const Icon(Icons.menu),
        actions: const [
          CircleAvatar(
            radius: 21,
            backgroundImage: NetworkImage(
                'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: const UhiPatientRegister(),
      bottomNavigationBar: const UhiBottomNavbar(),
    );
  }
}
