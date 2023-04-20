import 'package:flutter/material.dart';

class UhiComingSoon extends StatelessWidget {
  const UhiComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Comingsoon.png'),
          ]),
    );
  }
}
