import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UhiViewAllPrescriptionList extends StatelessWidget {
  List prescripList;
  String userName;
  String dosageCovertor(String str) {
    String dos = "";
    if (str[0] == "1") {
      dos += " morning ";
    }
    if (str[1] == "1") {
      dos += " afternoon ";
    }
    if (str[2] == "1") {
      dos += " evening ";
    }

    return dos;
  }

  UhiViewAllPrescriptionList(
      {super.key, required this.prescripList, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Passive Prescription'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: prescripList.length,
            shrinkWrap: true,
            itemBuilder: (context, pre) {
              return Card(
                elevation: 4,
                child: Container(
                  // height: 180,
                  width: double.infinity,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/Prescription.png',
                              height: 30, width: 30),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Patient name: ${userName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              prescripList[pre]["medicinesSuggested"].length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Drug name: ${prescripList[pre]["medicinesSuggested"][index]["name"]}',
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Quantity: ${prescripList[pre]["medicinesSuggested"][index]["qty"]}',
                                      style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Dosage: ${dosageCovertor(prescripList[pre]["medicinesSuggested"][index]["timeToConsume"])}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const Divider(
                                  height: 55,
                                  thickness: 1.6,
                                  color: Colors.grey,
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
