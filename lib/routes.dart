import 'package:instaid_dev/screens/login/login.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/screens/register/register.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
