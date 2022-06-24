import 'package:flutter/material.dart';
import 'package:instaid_dev/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Register Account",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
