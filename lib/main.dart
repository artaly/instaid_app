import 'package:flutter/material.dart';
import 'package:instaid_dev/screens/onboarding/onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color primaryColorRed = Color(0xffDE4E37);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstAID',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primaryColorRed,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Onboarding(),
    );
  }
}
