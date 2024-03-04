import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottom2NavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottom2NavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity, // Set the maximum width
        minHeight: 5.0, // Set the minimum height
      ),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.filter_1_outlined,
            text: 'Single',
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          ),
          GButton(
            icon: Icons.filter_2_outlined,
            text: 'Double',
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          ),
        ],
      ),
    );
  }
}
