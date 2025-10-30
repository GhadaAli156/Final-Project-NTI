import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/style/style.dart';

<<<<<<< HEAD
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

=======
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
<<<<<<< HEAD
          borderRadius: BorderRadius.circular(16),
          gradient: ColorManager.primaryColorGradient,
        ),
        child: GNav(
          rippleColor: Colors.blueGrey,
          hoverColor: Colors.grey,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
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
              leading: ClipRRect(child: Image.asset('assets/user.png')),
              text: 'Profile',
              textStyle: StyleApp.textStyle20,
            ),
          ],
        ),
      ),
=======
            borderRadius: BorderRadius.circular(16),
            gradient: ColorManager.primaryColorGradient
        ),
        child: GNav(
            rippleColor: Colors.blueGrey,
            hoverColor: Colors.grey,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.transparent,
            color: Colors.black,
            selectedIndex: _currentIndex,
            onTabChange: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            tabs: [
              GButton(icon: CupertinoIcons.home,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                text: 'Home',
                textStyle: StyleApp.textStyle20,),
              GButton(icon: CupertinoIcons.heart,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                text: 'Favorite',
                textStyle: StyleApp.textStyle20,),
              GButton(icon: CupertinoIcons.bell,
                iconColor: Colors.white,
                iconActiveColor: Colors.white,
                text: 'Updates',
                textStyle: StyleApp.textStyle20,),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                leading: ClipRRect(child: Image.asset('assets/user.png',)),
                text: 'Profile',
                textStyle: StyleApp.textStyle20,
              ),
      ]),
    )
>>>>>>> 15064677cafd3a76885c2277188b8d3ea7dad65a
    );
  }
}
