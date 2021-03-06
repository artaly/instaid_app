import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instaid_dev/components/custom_suffix_icon.dart';
import 'package:instaid_dev/components/default_button.dart';
import 'package:instaid_dev/components/form_error.dart';
import 'package:instaid_dev/components/no_account.dart';
import 'package:instaid_dev/constants.dart';
import 'package:instaid_dev/utils/colors.dart';
import 'package:instaid_dev/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to change your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> errors = [];
  String? email;
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            // onChanged: (value) {
            //   if (value.isNotEmpty) {
            //     setState(() {
            //       errors.remove(txtEmailNullErr);
            //       _email = value.trim();
            //     });
            //   } else if (emailValidatorRegExp.hasMatch(value) &&
            //       errors.contains(txtInvalidEmailErr)) {
            //     setState(() {
            //       errors.remove(txtInvalidEmailErr);
            //     });
            //   }

            //   return null;
            // },
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 42, vertical: 20),
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
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Send request",
            press: () {
              auth.sendPasswordResetEmail(email: _email);
              Fluttertoast.showToast(msg: "Password reset link sent!");
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccount(),
        ],
      ),
    );
  }
}
