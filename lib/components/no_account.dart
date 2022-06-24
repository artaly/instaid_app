import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {},
          child: Text("Register",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: primaryColorBlue)),
        ),
      ],
    );
  }
}
