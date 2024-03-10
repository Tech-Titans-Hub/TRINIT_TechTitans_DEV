// nav_bar.dart
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final Function(int) onTabTapped;
  final int currentIndex;

  CustomNavBar({required this.onTabTapped, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.warning),
          label: 'SOS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Crowdfunding',
        ),
      ],
    );
  }
}
