// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subwayapp/setalarm.dart';
import 'package:subwayapp/subwaylist.dart';
import 'package:subwayapp/waitscreen.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DDING',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SubwayList(),
    );
  }
}