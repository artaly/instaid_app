// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaid_dev/components/default_button.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/size_config.dart';

import '../../../components/custom_suffix_icon.dart';
import 'setup_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Complete Profile",
                style: headingStyle,
              ),
              Text(
                "Complete your details in order \nto continue",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              SetupProfileForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
