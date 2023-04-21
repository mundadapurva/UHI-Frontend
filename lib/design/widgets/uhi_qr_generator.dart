import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/config.dart';

class UhiQRGenerator extends StatefulWidget {
  const UhiQRGenerator(
      {super.key, required this.id, required this.name, required this.email});

  final String id;
  final String email;

  final String name;

  @override
  _UhiQRGeneratorState createState() => _UhiQRGeneratorState();
}

class _UhiQRGeneratorState extends State<UhiQRGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(height: 30),
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              QrImage(
                data: jsonEncode({
                  'id': widget.id,
                  'name': widget.name,
                }).toString(),
                size: 275,
              ),
              const SizedBox(height: 40),
              // buildTextField(context),
              const SizedBox(height: 20),
              const Text(
                'Scan this QR code to add your medical history to your profile.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        // controller: controller,

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
