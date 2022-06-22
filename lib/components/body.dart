// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaid_dev/components/background.dart';
import 'package:instaid_dev/components/rounded_input_field.dart';
import 'package:instaid_dev/components/text_field_container.dart';
import 'package:instaid_dev/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SvgPicture.asset(
          "assets/svg/first_onboard.svg",
          height: size.height * 0.35,
        ),
        RoundedInputField(
          hintText: "Your email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        )
      ],
    ));
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: primaryColorBlue,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: primaryColorBlue,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
