// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:susishop/page/front_screen.dart';
import 'package:susishop/page/home_screen.dart';

import 'provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FrontScreen(),
    );
  }
}
