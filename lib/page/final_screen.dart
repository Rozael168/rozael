// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/bottomNavigation.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottonNavigation()));
              },
              child: Image.asset(
                'assets/images/done.png',
                width: 200,
              ),
            ),
          ),
          Text(
            'Enjoy your yummy SuShi <3',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Thank!!',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
