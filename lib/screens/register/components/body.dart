// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/size_config.dart';

import 'register_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                Text(
                  "Complete the following details in\norder to open an account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                RegisterForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.07),
                //SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing, you confirm that you agree \nwith our Terms and Conditions',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
