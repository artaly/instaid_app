// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaid_dev/components/default_button.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/screens/home.dart';
import 'package:instaid_dev/size_config.dart';

import '../../../components/custom_suffix_icon.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                //_formKey.currentState!.save();
                // if all are valid then go to success screen
                //Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: txtPassNullErr);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: txtNotMatchPw);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: txtPassNullErr);
        } else if ((password != value)) {
          addError(error: txtNotMatchPw);
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/svg/lock.svg"),
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          )),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: txtPassNullErr);
        } else if (value.length >= 8) {
          removeError(error: txtPasswordShort);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: txtPassNullErr);
        } else if (value.length < 8) {
          addError(error: txtPasswordShort);
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/svg/lock.svg"),
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: txtEmailNullErr);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: txtInvalidEmailErr);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: txtEmailNullErr);
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: txtInvalidEmailErr);
        }

        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/svg/mail.svg"),
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: textColor),
            gapPadding: 10,
          )),
    );
  }
}
