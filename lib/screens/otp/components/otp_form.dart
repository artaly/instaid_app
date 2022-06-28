// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status { Waiting, Error }

class OTPForm extends StatefulWidget {
  const OTPForm({
    Key? key,
    this.number,
  }) : super(key: key);

  final number;

  @override
  _OTPFormState createState() => _OTPFormState(number);
}

class _OTPFormState extends State<OTPForm> {
  final phoneNumber;
  var _status = Status.Waiting;
  var _verificationId;

  _OTPFormState(this.phoneNumber);
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();

  String? userOTP;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: pin1,
                  autofocus: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: pin2,
                  focusNode: pin2FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: pin3,
                  focusNode: pin3FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: pin4,
                  focusNode: pin4FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              setState(() {
                userOTP = pin1.text + pin2.text + pin3.text + pin4.text;
              });
            },
          )
        ],
      ),
    );
  }
}
