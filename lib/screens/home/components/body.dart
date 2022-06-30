import 'package:flutter/material.dart';
import 'package:instaid_dev/size_config.dart';

import '../../../components/no_account.dart';
import '../../../utils/colors.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _buildEmergencyButton();
  }

  Material _buildEmergencyButton() {
    return Material(
      elevation: 20,
      type: MaterialType.button,
      color: primaryColorRed,
      borderRadius: BorderRadius.circular(1000),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: primaryColorRed, width: 2.0),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(
              Icons.sensors_rounded,
              color: Colors.white,
              size: SizeConfig.screenWidth * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
