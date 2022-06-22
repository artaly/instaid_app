import 'package:flutter/material.dart';
import 'package:instaid_dev/components/text_field_container.dart';
import 'package:instaid_dev/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: primaryColorBlue,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: primaryColorBlue,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
