import 'package:flutter/material.dart';
import 'package:instaid_dev/screens/otp/components/body.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}
