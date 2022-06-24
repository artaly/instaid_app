// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/size_config.dart';

import 'register_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            Text(
              "Register Account",
              style: headingStyle,
            ),
            Text(
              "Complete the following details in\norder to open an account",
              textAlign: TextAlign.center,
            ),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
