import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/screens/register/register.dart';
import 'package:instaid_dev/screens/home.dart';
import 'package:instaid_dev/screens/set_profile/set_profile.dart';
import 'package:instaid_dev/screens/otp/otp.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SetupProfile.routeName: (context) => SetupProfile(),
  OTPScreen.routeName: (context) => OTPScreen(),
};
