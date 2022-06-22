// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaid_dev/routes.dart';
import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/onboarding/onboard.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/screens/login/login.dart';
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
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            //iconTheme: IconThemeData(color: Colors.black)
            titleTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
                fontFamily: 'OpenSans', fontSize: 18, color: Color(0XFF8B8B8B)),
          ),
          scaffoldBackgroundColor: primaryBackground,
          primaryColor: primaryColorBlue,
          fontFamily: "Gotham",
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
