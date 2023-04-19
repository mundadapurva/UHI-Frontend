import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UhiQRGenerator extends StatefulWidget {
  const UhiQRGenerator({super.key});

  @override
  _UhiQRGeneratorState createState() => _UhiQRGeneratorState();
}

class _UhiQRGeneratorState extends State<UhiQRGenerator> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const SizedBox(height: 30),
              const Text(
                'Purva Mundada',
                style: TextStyle(
                  fontSize: 25,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'mundadapurva02@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              QrImage(
                data: controller.text,
                size: 200,
              ),
              // const SizedBox(height: 40),
              // buildTextField(context),
            ])));
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          hintText: 'Enter a message',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => setState(() {}),
          ),
        ),
      );
}
