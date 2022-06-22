import 'package:flutter/material.dart';
import 'package:instaid_dev/components/text_field_container.dart';
import 'package:instaid_dev/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: "Your email",
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: primaryColorLBlue,
          )),
    ));
  }
}
