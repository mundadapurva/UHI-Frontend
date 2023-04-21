import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:landing_page/logic/query_bloc/query_bloc.dart';
import 'package:landing_page/utils/get_auth_token.dart';

// ignore: use_key_in_widget_constructors
class AppointmentsHome extends StatefulWidget {
  const AppointmentsHome({
    super.key,
    required this.doctorName,
    required this.docId,
  });

  final String doctorName;
  final String docId;
  @override
  _AppointmentsHomeState createState() => _AppointmentsHomeState();
}

DateTime combine(DateTime date, TimeOfDay? time) => DateTime(
    date.year, date.month, date.day, time?.hour ?? 0, time?.minute ?? 0);

class _AppointmentsHomeState extends State<AppointmentsHome> {
  late DateTime _myDateTime;
  String date = '___';
  TimeOfDay time = TimeOfDay.now();
  DateTime appointmentDateTime = DateTime.now();
  double xOffeset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double val = 0;
  bool isDrawerOpen = false;
  String getTiming() {
    //will return the timing in a string format
    // ignore: unnecessary_null_comparison
    if (time == null) {
      return '_';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
      return '$hours: $minutes';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final rightSlide = MediaQuery.of(context).size.width * 0.7;

    return BlocListener<QueryBloc, QueryState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is QuerySuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment Booked'),
            ),
          );
        }
        if (state is QueryFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment Booking Failed'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book an Appointment'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                color: Colors.blue.withOpacity(0.8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: const BoxDecoration(
                        // color: Colors.cyan.shade800.withOpacity(0.4),

                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      width: MediaQuery.of(context).size.width * 0.82,
                      height: MediaQuery.of(context).size.height * 0.58,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.0128,
                          ),
                          const Text(
                            'Choose a suitable date: *',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0128,
                          ),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: height * 0.0384,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0128,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed: () async {
                              _myDateTime = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2050),
                                  )) ??
                                  DateTime.now();
                              setState(() {
                                date =
                                    DateFormat('dd/MM/yy').format(_myDateTime);
                                appointmentDateTime = _myDateTime;
                              });
                            },
                            child: const Text(
                              'CHOOSE DATE',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Divider(
                            height: height * 0.0384,
                            thickness: 1.0,
                            color: Colors.white,
                          ),
                          const Text(
                            'Choose a time slot: *',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            getTiming(),
                            style: TextStyle(
                              fontSize: height * 0.0384,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0128,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed: () async {
                              final newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              setState(() {
                                time = newTime ?? TimeOfDay.now();
                              });
                            },
                            child: const Text(
                              'CHOOSE TIMING',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Divider(
                            height: height * 0.0384,
                            thickness: 1.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: height * 0.0128,
                          ),
                          const Text(
                            '*This is not a confirmed appointment. It may vary as per the Doctor\'s availability',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              appointmentDateTime = combine(
                                appointmentDateTime,
                                time,
                              );
                              log(appointmentDateTime.toString());
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) => const AppDrawer()));

                              // while (Navigator.canPop(context)) {
                              //   Future.delayed(const Duration(microseconds: 10));
                              //   Navigator.pop(context);
                              // }
                              final userId = await getUserID();
                              BlocProvider.of<QueryBloc>(context).add(
                                BookAppointmentQueryEvent(
                                  dateTime: appointmentDateTime,
                                  doctorId: widget.docId,
                                  userId: userId!,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              padding: const EdgeInsets.all(12),
                            ),
                            child: const Text(
                              'CONFIRM DATE AND TIME',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
