import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page/logic/query_bloc/query_bloc.dart';

class UhiBottomSheet extends StatefulWidget {
  UhiBottomSheet({super.key, required this.userId});

  String userId;
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
    return BlocListener<QueryBloc, QueryState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is QuerySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      child: ListView(
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
                            BlocProvider.of<QueryBloc>(context).add(
                                AddMedicalHistoryQueryEvent(
                                    userId: widget.userId,
                                    name: name,
                                    symptoms: symptoms,
                                    diagnosis: diagnosis,
                                    fees: fees,
                                    remedies: remedies));
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
      ),
    );
  }
}
