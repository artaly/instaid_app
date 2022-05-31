// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'content_model.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: contents.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  SvgPicture.asset(
                    contents[i].image,
                    height: 280,
                  ),
                  Text(
                    contents[i].title,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    contents[i].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            );
          }),
    );
  }
}
