import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaid_dev/components/custom_suffix_icon.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/size_config.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/components/default_button.dart';

import '../../../components/no_account.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Welcome back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              LoginForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              NoAccount(),
            ]),
          ),
        ),
      ),
    );
  }
}
