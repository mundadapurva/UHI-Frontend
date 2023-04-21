import 'package:flutter/material.dart';
import 'package:landing_page/design/widgets/uhi_book_bed.dart';
import 'package:landing_page/home_page.dart';

import 'uhi_book_appointment.dart';
import 'uhi_chemist_register.dart';
import 'uhi_doctor_register.dart';

class UhiBottomNavbar extends StatefulWidget {
  const UhiBottomNavbar({super.key});

  @override
  State<UhiBottomNavbar> createState() => _UhiBottomNavbarState();
}

class _UhiBottomNavbarState extends State<UhiBottomNavbar> {
  PageController _pageController = PageController();
  int pageIndex = 1;

  List<Widget> pages = [
    const UhiBookAppointment(),
    const MyHomePage(),
    const UhiBookBed(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 14.5,
        selectedItemColor: Colors.blue,
        unselectedFontSize: 13,
        currentIndex: pageIndex,
        onTap: gotoPage,
        // onTap: (index) {
        //   switch (index) {
        //     case 0:
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const UhiBookAppointment(),
        //         ),
        //       );
        //       break;
        //     case 1:
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const MyHomePage(),
        //         ),
        //       );
        //       break;
        //     case 2:
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const UhiBookBed(),
        //         ),
        //       );
        //       break;
        //   }
        // },
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
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      pageIndex = page;
      // print(page);
    });
  }

  void gotoPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
