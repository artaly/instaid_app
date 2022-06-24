import 'package:flutter/material.dart';

import '../register/components/body.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Body(),
    );
  }
}
