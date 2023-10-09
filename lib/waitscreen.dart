// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:subwayapp/home.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({super.key});

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  var stationName = "삼성";
  var minutes = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/trains.png"),
                        height: 50,
                      ),
                      Text(" DDING",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
        ),
        body: Stack(children: [
      // Positioned.fill(
      //   child: Image.asset(
      //     'assets/subwaymap.png',
      //     fit: BoxFit.cover,
      //   ),
      // ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color:
                Colors.white.withOpacity(0.5), // Adjust the opacity as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Text(
                  "$stationName역",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  "$minutes분후 도착합니다",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 160,),
                Image.asset(
                  "assets/subwayanimation.gif",
                  height: 80,
                ),
                SizedBox(height: 140,),
                Center(),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                    print("Subway selected");
                  },
                child: Text("확인")),
              ],
            ),
          ))
    ]));
  }
}