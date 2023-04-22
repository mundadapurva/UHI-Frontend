import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page/design/widgets/chemist/uhi_chemist_dashboard.dart';
import 'package:landing_page/design/widgets/uhi_add_prescription.dart';
import 'package:landing_page/design/widgets/uhi_bottom_navbar.dart';
import 'package:landing_page/design/widgets/uhi_doctor_dashboard.dart';
import 'package:landing_page/design/widgets/uhi_intro_screen.dart';
import 'package:landing_page/logic/query_bloc/query_bloc.dart';
import 'package:landing_page/uhi_local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'design/pages/login_page.dart';
import 'design/widgets/uhi_book_appointment.dart';
import 'design/widgets/uhi_chemist_register.dart';
import 'home_page.dart';
import 'logic/auth_bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? authToken = prefs.getString('accessToken');
  runApp(MyApp(
    authToken: authToken,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.authToken});
  String? authToken;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QueryBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Unified Healthcare Interface',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.light,
        // home: LoginPage(type: 'user', id: authToken!),
        // home: authToken != null ? const UhiBottomNavbar() : const UhiIntroScreen(),
        home: authToken != null ? UhiDoctorDashboard() : const UhiIntroScreen(),
        // home:  authToken != null ? const UhiChemistDashboard() : const UhiIntroScreen(),

        // home: UhiAddPrescription(),
      ),
    );
  }
}
