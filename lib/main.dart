import 'package:flutter/material.dart';
import 'package:instaid_dev/screens/onboarding/onboard.dart';
import 'package:instaid_dev/constants.dart';

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
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Onboarding(),
    );
  }
}
