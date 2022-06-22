import 'package:flutter/material.dart';
import 'package:instaid_dev/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = primaryColorBlue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            onPressed: press(),
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                backgroundColor: primaryColorBlue)),
      ),
    );
  }
}
