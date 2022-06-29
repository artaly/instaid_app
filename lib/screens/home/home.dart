// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaid_dev/size_config.dart';
import 'package:instaid_dev/utils/colors.dart';
import 'package:instaid_dev/utils/enum.dart';

import '../../components/custom_bottom_navbar.dart';

// class HomeScreen extends StatelessWidget {
//   static String routeName = "/home";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Home Page"),
//         ),
//         backgroundColor: primaryBackground,
//         bottomNavigationBar: CustomNavBar());
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        backgroundColor: primaryBackground,
        bottomNavigationBar: CustomNavBar());
  }
}
