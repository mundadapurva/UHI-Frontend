import 'package:flutter/material.dart';
import 'package:landing_page/utils/get_auth_token.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../utils/config.dart';
import 'package:http/http.dart' as http;

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

class UhiViewPrescriptionList extends StatefulWidget {
  UhiViewPrescriptionList(
      {super.key,
      required this.prescripList,
      required this.userAadhar,
      required this.userName});
  List prescripList;
  String userAadhar;
  String userName;
  @override
  State<UhiViewPrescriptionList> createState() =>
      _UhiViewPrescriptionListState();
}

class _UhiViewPrescriptionListState extends State<UhiViewPrescriptionList> {
  Future MarkAsPassive(int index) async {
    String? chemistId = await getUserID();
    const baseUrl = BaseUrl.baseUrl;

    const api = '$baseUrl/chemist/update-prescription';
    final url = Uri.parse(api);

    final token = await getAuthToken();

    try {
      var body = {
        "aadhar": widget.userAadhar,
        "prescriptionId": widget.prescripList[index]['uid'],
        "chemistId": chemistId
      };
      final response = await http.post(url,
          headers: {
            'authorization': 'Bearer $token'
            // "Content-Type": "application/json"
          },
          body: body);
      if (response.statusCode == 200) {
        widget.prescripList.removeAt(index);
        return 'Updated Sucessfuly ';
      } else {
        return 'error occured';
      }
    } catch (e) {
      // emit(QueryFailure(message: e.toString()));
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Active Prescription'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.prescripList.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/Prescription.png',
                                height: 30, width: 30),
                            ToggleSwitch(
                              minWidth: 77.0,
                              minHeight: 30.0,
                              cornerRadius: 4.0,
                              activeBgColors: [
                                [Colors.green],
                                [Colors.red[800]!]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: 0,
                              totalSwitches: 2,
                              labels: const [
                                'Active',
                                'Passive',
                              ],
                              radiusStyle: true,
                              onToggle: (index) async {
                                print('switched to: $index');
                                var message = await MarkAsPassive(pre);
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)));
                                print(message);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Patient name: ${widget.userName}',
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
                            itemCount: widget
                                .prescripList[pre]["medicinesSuggested"].length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Drug name: ${widget.prescripList[pre]["medicinesSuggested"][index]["name"]}',
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Quantity: ${widget.prescripList[pre]["medicinesSuggested"][index]["qty"]}',
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Dosage: ${dosageCovertor(widget.prescripList[pre]["medicinesSuggested"][index]["timeToConsume"])}',
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
      ),
    );
  }
}
