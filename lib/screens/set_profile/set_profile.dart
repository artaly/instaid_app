import 'package:flutter/material.dart';
import 'package:instaid_dev/screens/set_profile/components/body.dart';

class SetupProfile extends StatelessWidget {
  static String routeName = "/setup_profile";
  const SetupProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Setup"),
      ),
      body: Body(),
    );
  }
}
