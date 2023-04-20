import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:landing_page/design/widgets/uhi_drawer.dart';

import '../widgets/uhi_medical_history_list_user.dart';

class UserMedicalHistory extends StatelessWidget {
  const UserMedicalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical History'),
      ),
      drawer: UhiDrawer(),
      body: UhiMedicalHistoryList(),
    );
  }
}
