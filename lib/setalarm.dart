// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:subwayapp/custom_radio_grouped_button.dart';
import 'package:subwayapp/waitscreen.dart';

class SetAlarm extends StatefulWidget {
  const SetAlarm({super.key});

  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        title: Text(
          "알람설정",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "7:24출발 → 7:42도착",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            "(38분)",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 30,),
          Text(
            "Step 1: Select Method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          CustomRadioButton(
            icon: [
              "assets/icons/bell.png",
              "assets/icons/vibration.png",
              "assets/icons/sound.png",
            ],
            iconSize: [
              50,
              50,
              50,
            ],
            elevation: 0,
            // absoluteZeroSpacing: true,
            unSelectedColor: Colors.green.withOpacity(0.2),
            unSelectedBorderColor: Colors.green.withOpacity(0.2),
            selectedBorderColor: Colors.green,
            width: 120,
            height: 100,
            buttonLables: [
              '알림',
              '진동',
              '소리',
            ],
            buttonValues: [
              "notifications",
              "vibration",
              "sound",
            ],
            defaultSelected: "vibration",
            buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.black,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),
            radioButtonValue: (value) {
              print(value);
            },
            selectedColor: Colors.green,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Step 2: Select Time",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          CustomRadioButton(
            icon: [
              "assets/icons/5min.png",
              "assets/icons/3min.png",
              "assets/icons/1min.png",
            ],
            iconSize: [
              50,
              50,
              50,
            ],
            elevation: 0,
            // absoluteZeroSpacing: true,
            unSelectedColor: Colors.green.withOpacity(0.2),
            unSelectedBorderColor: Colors.green.withOpacity(0.2),
            selectedBorderColor: Colors.green,
            width: 120,
            height: 100,
            buttonLables: [
              'empty',
              'empty',
              'empty',
            ],
            buttonValues: [
              "5",
              "3",
              "1",
            ],
            defaultSelected: "3",
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.black,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 18)),
            radioButtonValue: (value) {
              print(value);
            },
            selectedColor: Colors.green,
          ),
          SizedBox(height: 50,),
          SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => WaitScreen()),
                  // );
                  print("Alarm created.");
                },
                child: Text("확인",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ))),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    ))]));
  }
}
