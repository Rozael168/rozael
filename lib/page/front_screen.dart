// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:susishop/components/button.dart';

class FrontScreen extends StatefulWidget {
  FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'SUSHI MAN',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              Image.asset(
                'assets/images/sushi5.png',
                width: 400,
              ),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Feel the taste of the most popular Japanese food',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'from anywhere and anytime',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Center(
                child: MyButton(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
