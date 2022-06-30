import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/screens/main_screen.dart';
import 'package:instaid_dev/screens/register/register.dart';
import 'package:instaid_dev/screens/home/home.dart';
import 'package:instaid_dev/screens/otp/otp.dart';
import 'package:instaid_dev/screens/main_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  OTPScreen.routeName: (context) => OTPScreen(),
  MainScreen.routeName: (context) => MainScreen(),
};
