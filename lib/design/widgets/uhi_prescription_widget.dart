import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_add_prescription.dart';

class PrescriptionWidget extends StatefulWidget {
  PrescriptionWidget(
      {super.key, required this.prescription, required this.index});
  PrescriptionObject prescription;
  int index;
  @override
  State<PrescriptionWidget> createState() => _PrescriptionWidgetState();
}

class _PrescriptionWidgetState extends State<PrescriptionWidget> {
  // Map<String, String> medicineObject = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
              onChanged: (val) {
                widget.prescription.prescriptionList[widget.index]['name'] =
                    val;
              },
              onSaved: (newValue) {
                setState(() {});
              },
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
              maxLength: 3,
              decoration: const InputDecoration(
                hintText: 'Enter dosage',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
                counter: Offstage(),
              ),
              onChanged: (val) {
                widget.prescription.prescriptionList[widget.index]
                    ['timeToConsume'] = val;
              },
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
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter quantity',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
                counter: Offstage(),
              ),
              onChanged: (val) {
                widget.prescription.prescriptionList[widget.index]['qty'] = val;
              },
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            const Divider(
              height: 80,
              thickness: 2,
              color: Colors.grey,
            )
          ]),
    );
  }
}
