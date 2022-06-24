import 'package:flutter/material.dart';
import 'package:instaid_dev/screens/login/components/forgotp_body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
