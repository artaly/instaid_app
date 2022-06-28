import 'package:flutter/material.dart';
import 'package:instaid_dev/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Pager"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 20,
              color: primaryColor,
            ),
          ],
        ),
        child: SafeArea(child: Row(children: [])),
      ),
    );
  }
}
