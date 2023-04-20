import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_doctor_register.dart';
import 'package:landing_page/design/widgets/uhi_patient_register.dart';
import 'package:landing_page/home_page.dart';

import 'uhi_chemist_register.dart';

class UhiIntroScreen extends StatelessWidget {
  const UhiIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/IntroScreen2.png',
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Unified Healthcare Interface',
                      speed: const Duration(milliseconds: 70),
                      textStyle: const TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  displayFullTextOnTap: true,
                  stopPauseOnTap: false,
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Swipe right to continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/Reception.png',
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Get Started?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                const Text(
                  'REGISTER AS:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(17),
                  margin: const EdgeInsets.all(10),
                  child: AnimatedButton(
                    color: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const UhiPatientRegister(),
                      ));
                    },
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    width: 170,
                    height: 55,
                    child: const Text(
                      'PATIENT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(17),
                  margin: const EdgeInsets.all(10),
                  child: AnimatedButton(
                    color: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const UhiChemistRegister(),
                      ));
                    },
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    width: 170,
                    height: 55,
                    child: const Text(
                      'CHEMIST',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(17),
                  margin: const EdgeInsets.all(10),
                  child: AnimatedButton(
                    color: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const UhiDoctorRegister(),
                      ));
                    },
                    enabled: true,
                    shadowDegree: ShadowDegree.light,
                    width: 170,
                    height: 55,
                    child: const Text(
                      'DOCTOR',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
