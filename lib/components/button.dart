// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:susishop/components/bottomNavigation.dart';
import 'package:susishop/page/home_screen.dart';

class MyButton extends StatefulWidget {
  MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
              child: BottonNavigation(), type: PageTransitionType.rightToLeft),
        );
      },
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.green[400],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get in to',
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.arrow_right,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
