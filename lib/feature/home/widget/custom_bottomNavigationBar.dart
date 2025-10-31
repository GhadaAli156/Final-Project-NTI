import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/style/style.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageSize = screenWidth * 0.1;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: ColorManager.primaryColorGradient,
        ),
        child: GNav(
          rippleColor: Colors.blueGrey,
          hoverColor: Colors.grey,
          gap: 8,
          activeColor: Colors.black,
          iconSize: screenWidth * 0.07,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.015,
          ),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.transparent,
          color: Colors.black,
          selectedIndex: currentIndex,
          onTabChange: onTabChange,
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Home',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: CupertinoIcons.heart,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Favorite',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: CupertinoIcons.bell,
              iconColor: Colors.white,
              iconActiveColor: Colors.white,
              text: 'Updates',
              textStyle: StyleApp.textStyle20,
            ),
            GButton(
              icon: Icons.circle,
              iconColor: Colors.transparent,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/user.png',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
              text: 'Profile',
              textStyle: StyleApp.textStyle20,
            ),
          ],
        ),
      ),
    );
  }
}
