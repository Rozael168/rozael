// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class PromoButton extends StatelessWidget {
  late String text;
  PromoButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        height: 45,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.green[400],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18),
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
