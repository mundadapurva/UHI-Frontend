import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_bottom_sheet.dart';
import 'package:landing_page/design/widgets/uhi_medical_history_list.dart';

class UhiAddMedicalHistory extends StatefulWidget {

  const UhiAddMedicalHistory({super.key, required this.userId});
  final String userId;
  @override
  State<UhiAddMedicalHistory> createState() => _UhiAddMedicalHistoryState();
}

class _UhiAddMedicalHistoryState extends State<UhiAddMedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'View Medical History:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            UhiMedicalHistoryList(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) => UhiBottomSheet(userId: widget.userId,),
                    );
                  },
                  child: const Text('Add Medical History'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
