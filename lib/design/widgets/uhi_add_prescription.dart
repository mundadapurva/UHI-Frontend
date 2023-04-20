import 'package:flutter/material.dart';

class UhiAddPrescription extends StatefulWidget {
  const UhiAddPrescription({super.key});

  @override
  State<UhiAddPrescription> createState() => _UhiAddPrescriptionState();
}

class _UhiAddPrescriptionState extends State<UhiAddPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Image.asset(
                'assets/images/Prescription.png',
                height: 50,
                width: 50,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Text(
                'DRUG NAME',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter drug name';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: 'Enter drug name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  counter: Offstage(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'DOSAGE',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter dosage';
                  }
                  return null;
                },
                maxLength: 20,
                decoration: const InputDecoration(
                  hintText: 'Enter dosage',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  counter: Offstage(),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'QUANTITY',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
                maxLength: 5,
                decoration: const InputDecoration(
                  hintText: 'Enter quantity',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(5),
                  counter: Offstage(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ADD MORE',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
