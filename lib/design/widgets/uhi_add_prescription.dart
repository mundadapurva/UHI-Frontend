import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page/design/widgets/uhi_prescription_widget.dart';
import 'package:landing_page/logic/query_bloc/query_bloc.dart';

class UhiAddPrescription extends StatefulWidget {
  const UhiAddPrescription(
      {super.key, required this.userId, required this.userName});

  final String userId;
  final String userName;
  @override
  State<UhiAddPrescription> createState() => _UhiAddPrescriptionState();
}

class _UhiAddPrescriptionState extends State<UhiAddPrescription> {
  final _formKey = GlobalKey<FormState>();
  int itemCount = 1;
  Map<String, String> userObject = {};
  List medicines = [];
  PrescriptionObject prescriptionObject = PrescriptionObject();
  @override
  Widget build(BuildContext context) {
    return BlocListener<QueryBloc, QueryState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is QuerySuccess) {
          Navigator.of(context).pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Prescription.png',
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => PrescriptionWidget(
                          prescription: prescriptionObject, index: index),
                      itemCount: itemCount,
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
                          onPressed: () {
                            setState(() {
                              Map medicine = {
                                "name": "test",
                                "price": "100",
                                "timeToConsume": "111",
                                "qty": "1"
                              };
                              prescriptionObject.prescriptionList.add(medicine);
                              itemCount++;
                            });
                          },
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
                          onPressed: () {
                            // final form = _formKey.currentState!;
                            // log(prescriptionObject.getPrescriptionList
                            //     .toString());
                            List finalPrescriptionList =
                                prescriptionObject.getPrescriptionList;
                            BlocProvider.of<QueryBloc>(context)
                                .add(AddPrescriptionQueryEvent(
                              prescriptions: finalPrescriptionList,
                              userId: widget.userId,
                            ));
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
          ),
        ),
      ),
    );
  }
}

class PrescriptionObject {
  List prescriptionList = [
    {"name": "test", "price": "100", "timeToConsume": "111", "qty": "1"}
  ];

  List get getPrescriptionList => prescriptionList;
}
