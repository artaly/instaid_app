// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaid_dev/components/custom_suffix_icon.dart';
import 'package:instaid_dev/components/default_button.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/size_config.dart';
import 'package:instaid_dev/constants.dart';

import '../../home.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? errorMessage;
  bool? remember = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        //FormError(errors: errors),
        Row(
          children: [
            Checkbox(
              value: remember,
              activeColor: primaryColorBlue,
              onChanged: (value) {
                setState(() {
                  remember = value;
                });
              },
            ),
            Text("Remember me"),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPassword.routeName),
              child: Text(
                "Forgot password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        DefaultButton(
          text: "Continue",
          press: () {
            logIn(emailController.text, passwordController.text);
          },
        ),
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(txtPassNullErr)) {
          // setState(() {
          //   errors.remove(txtPassNullErr);
          // });
          // } else if (!emailValidatorRegExp.hasMatch(value) &&
          //     !errors.contains(txtInvalidEmailErr)) {
          //   setState(() {
          //     errors.add(txtInvalidEmailErr);
          //   });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && errors.contains(txtPassNullErr)) {
          // setState(() {
          //   errors.add(txtPassNullErr);
          // });
          return (txtPassNullErr);
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(txtInvalidEmailErr)) {
          // setState(() {
          //   errors.add(txtInvalidEmailErr);
          // });
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
      controller: emailController,
      onSaved: (value) {
        emailController.text = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(txtEmailNullErr)) {
          // setState(() {
          //   errors.remove(txtEmailNullErr);
          // });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(txtInvalidEmailErr)) {
          // setState(() {
          //   errors.remove(txtInvalidEmailErr);
          // });
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // setState(() {
          //   errors.add(txtEmailNullErr);
          // });
          return (txtEmailNullErr);
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(txtInvalidEmailErr)) {
          // setState(() {
          //   errors.add(txtInvalidEmailErr);
          // });
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/svg/mail.svg"),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: textColor),
          gapPadding: 5,
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(28),
        //   borderSide: BorderSide(color: textColor),
        //   gapPadding: 5,
        // )
      ),
    );
  }

  void logIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
