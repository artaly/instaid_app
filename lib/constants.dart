import 'package:flutter/material.dart';

import 'size_config.dart';

const primaryColorBlue = Color(0xFF699EAD);
const primaryColorRed = Color(0xFFDE4E37);
const primaryDark = Color(0xFF3F3F3F);
const primaryBackground = Color(0xFFF6F7FB);
const primaryColorLBlue = Color(0xFF465156);

const textColor = Color(0xFF757575);

// For form errors

const String txtEmailNullErr = "Please enter your email";
const String txtInvalidEmailErr = "Please enter valid email";
const String txtPassNullErr = "Please enter your password";
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String txtWrongPassword = "Wrong password";
const String txtNotMatchPw = "Password does not match";
const String txtPasswordShort = "Password too short";
const String txtNameNull = "Please enter your name";
const String txtPhoneNoNull = "Please enter your phone number";
const String txtAddressNull = "Please enter your address";

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);
