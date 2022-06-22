import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaid_dev/routes.dart';
import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/onboarding/onboard.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstAID',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColorBlue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Color(0xFF8888), fontSize: 19),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
