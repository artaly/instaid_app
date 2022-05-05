import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 3,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/first_onboard.svg",
                    height: 280,
                  ),
                  Text(
                    "Test",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
