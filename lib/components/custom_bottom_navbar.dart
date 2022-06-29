// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../size_config.dart';
import '../utils/colors.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight * 0.09,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF4F5F9),
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0XFF686868),
        selectedFontSize: 14,
        currentIndex: _selectedIndex,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Contatcs',
            icon: Icon(Icons.contact_phone_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Location',
            icon: Icon(Icons.location_pin),
          ),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}



// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SizedBox(
//       height: SizeConfig.screenHeight * 0.09,
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Color(0xFFF4F5F9),
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Color(0XFF686868),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         onTap: (value) {
//           // Respond to item press.
//         },
//         // ignore: prefer_const_literals_to_create_immutables
//         items: [
//           BottomNavigationBarItem(
//             label: 'Home',
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: 'Contatcs',
//             icon: Icon(Icons.contact_phone_rounded),
//           ),
//           BottomNavigationBarItem(
//             label: 'Location',
//             icon: Icon(Icons.location_pin),
//           ),
//           BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }
