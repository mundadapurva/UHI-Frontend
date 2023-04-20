import 'package:flutter/material.dart';

class UhiBottomSheet extends StatefulWidget {
  UhiBottomSheet({super.key});

  @override
  State<UhiBottomSheet> createState() => _UhiBottomSheetState();
}

class _UhiBottomSheetState extends State<UhiBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  String name = "";

  String symptoms = "";

  String diagnosis = "";

  String fees = "";

  String remedies = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Text(
                  'PATIENT NAME',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter patient name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    hintText: 'Enter patient name',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    counter: Offstage(),
                  ),
                  onSaved: (newValue) {
                    setState(() {
                      name = newValue.toString();
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  'SYMPTOMS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      symptoms = newValue.toString();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter symptoms';
                    }
                    return null;
                  },
                  maxLength: 20,
                  decoration: const InputDecoration(
                    hintText: 'Enter symptoms',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    counter: Offstage(),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  'DIAGNOSIS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      diagnosis = newValue.toString();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter diagnosis';
                    }
                    return null;
                  },
                  maxLength: 20,
                  decoration: const InputDecoration(
                    hintText: 'Enter diagnosis',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    counter: Offstage(),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'FEES',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    setState(() {
                      fees = newValue.toString();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter fees';
                    }
                    return null;
                  },
                  maxLength: 10,
                  decoration: const InputDecoration(
                    hintText: 'Enter fees',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    counter: Offstage(),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  'HOME REMEDIES / EXERCISES (if any)',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      remedies = newValue.toString();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter home remedies';
                    }
                    return null;
                  },
                  maxLength: 20,
                  decoration: const InputDecoration(
                    hintText: 'Enter home remedies/exercise',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(5),
                    counter: Offstage(),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form!.validate()) {
                          form.save();
                          Map prescription = {
                            "userId": "111111111111",
                            "symptoms": "Dried thorat",
                            "diagnosis": "Fever",
                            "totalFees": "1000",
                            // "aliment": "Medicines",
                            "suggestedRemedy": "Rest & Yoga",
                            "doctorName": "Ramesh"
                          };
                        }
                      },
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
      ],
    );
  }
}
