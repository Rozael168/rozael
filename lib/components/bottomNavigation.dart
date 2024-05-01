// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:susishop/page/cart_screen.dart';

import 'package:susishop/page/home_screen.dart';

class BottonNavigation extends StatefulWidget {
  BottonNavigation({Key? key}) : super(key: key);

  @override
  State<BottonNavigation> createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  final screen = [
    HomeScreen(),
    CartScreen(),
    // FavoriteScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: screen[_currentIndex],
      bottomNavigationBar: GNav(
        gap: 2,
        activeColor: Colors.white,
        tabActiveBorder: Border.all(color: Colors.green),
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            style: GnavStyle.oldSchool,
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Shop',
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            style: GnavStyle.google,
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: screen[_currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: Colors.green,
    //     elevation: 0,
    //     backgroundColor: Colors.green.shade100,
    //     currentIndex: _currentIndex,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //         backgroundColor: Colors.green[300],
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.shopping_cart),
    //         label: 'Cart',
    //         backgroundColor: Colors.green[300],
    //       ),
    //       // BottomNavigationBarItem(
    //       //   icon: Icon(Icons.star),
    //       //   label: 'Favorite',
    //       //   backgroundColor: Colors.green[300],
    //       // ),
    //     ],
    // onTap: (index) {
    //   setState(() {
    //     _currentIndex = index;
    //   });
    // },
    //   ),

    // );
  }
}
