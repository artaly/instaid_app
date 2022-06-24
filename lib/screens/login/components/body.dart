import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaid_dev/components/custom_suffix_icon.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:instaid_dev/screens/login/forgot_password.dart';
import 'package:instaid_dev/size_config.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/components/default_button.dart';

import '../../../components/no_account.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Welcome back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              LoginForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              NoAccount(),
            ]),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
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
        FormError(errors: errors),
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
            Text(
              "Forgot password",
              style: TextStyle(decoration: TextDecoration.underline),
            )
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        DefaultButton(
          text: "Continue",
          press: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
          },
        ),
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(txtPassNullErr)) {
          setState(() {
            errors.remove(txtPassNullErr);
          });
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
          setState(() {
            errors.add(txtPassNullErr);
          });
          // } else if (!emailValidatorRegExp.hasMatch(value) &&
          //     !errors.contains(txtInvalidEmailErr)) {
          //   setState(() {
          //     errors.add(txtInvalidEmailErr);
          //   });
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
        if (value.isNotEmpty && errors.contains(txtEmailNullErr)) {
          setState(() {
            errors.remove(txtEmailNullErr);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(txtInvalidEmailErr)) {
          setState(() {
            errors.remove(txtInvalidEmailErr);
          });
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty && errors.contains(txtEmailNullErr)) {
          setState(() {
            errors.add(txtEmailNullErr);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(txtInvalidEmailErr)) {
          setState(() {
            errors.add(txtInvalidEmailErr);
          });
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
