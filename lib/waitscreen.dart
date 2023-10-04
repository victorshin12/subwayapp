// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WaitScreen extends StatefulWidget {
  const WaitScreen({super.key});

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.green,
        //   title: Text("Subway App"),
        // ),
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/subwaymap.png',
          fit: BoxFit.cover,
        ),
      ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color:
                Colors.white.withOpacity(0.5), // Adjust the opacity as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 120),
                  child: Row(
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
                Text("출발지", style: TextStyle(fontSize: 24)),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 40),
                    child: Container(
                      child: Placeholder(),
                    )),
                Text("도착지", style: TextStyle(fontSize: 24)),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 40),
                    child: Container(
                      child: Placeholder(),
                    )),
                Spacer(),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.3),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WaitScreen()),
                        );

                        print("Route selected");
                      },
                      child: Text("선택",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ))),
                ),
                // SizedBox(height: 50,),
                Spacer(),
              ],
            ),
          ))
    ]));
  }
}