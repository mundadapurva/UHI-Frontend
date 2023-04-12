import 'package:flutter/material.dart';

import 'design/widgets/uhi_bottom_navbar.dart';
import 'design/widgets/uhi_carousel.dart';

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
        title: const Text('Unified Healthcare Interface'),
        centerTitle: true,
        elevation: 8,
      ),
      body: const UhiCarousel(),
      bottomNavigationBar: const UhiBottomNavbar(),
    );
  }
}
