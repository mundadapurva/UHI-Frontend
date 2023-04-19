import 'package:flutter/material.dart';

import 'uhi_book_appointment.dart';
import 'uhi_chemist_register.dart';
import 'uhi_doctor_register.dart';

class UhiBottomNavbar extends StatelessWidget {
  const UhiBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 25,
      selectedFontSize: 14.5,
      selectedItemColor: Colors.blue,
      unselectedFontSize: 13,
      currentIndex: 0,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_hospital,
          ),
          label: 'Book Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bed,
          ),
          label: 'Book Bed',
        ),
      ],
    );
  }
}
