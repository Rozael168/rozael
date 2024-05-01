// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SettingScren extends StatefulWidget {
  SettingScren({Key? key}) : super(key: key);

  @override
  State<SettingScren> createState() => _SettingScrenState();
}

class _SettingScrenState extends State<SettingScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Setting Screen'),
      ),
    );
  }
}
