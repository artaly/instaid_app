// ignore_for_file: prefer_const_constructors
// Test commit
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaid_dev/utils/routes.dart';
import 'package:instaid_dev/screens/home/home.dart';
import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/main_screen.dart';
import 'package:instaid_dev/screens/onboarding/onboard.dart';
import 'package:instaid_dev/utils/colors.dart';
import 'package:instaid_dev/screens/login/login.dart';

import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          primaryColor: primaryColor,
          fontFamily: "Gotham",
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: MainScreen.routeName,
      routes: routes,
    );
  }
}
