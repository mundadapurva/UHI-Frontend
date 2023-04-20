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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 30),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 25,
                // fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.email,
              style: TextStyle(
                fontSize: 15,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            QrImage(
              data: jsonEncode({
                widget.id,
                widget.name,
              }),
              size: 200,
            ),
            // const SizedBox(height: 40),
            // buildTextField(context),
          ],
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
