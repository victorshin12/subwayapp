// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:subwayapp/custom_radio_grouped_button.dart';

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
        title: Text(
          "알람설정",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(), //idk why the alignment breaks if i remove this
          Text(
            "Info",
          ),
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
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.black,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 18)),
            radioButtonValue: (value) {
              print(value);
            },
            selectedColor: Colors.green,
          ),
          SizedBox(height: 30,),
          Text(
            "Step 2: Select Time",
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
            elevation: 0,
            // absoluteZeroSpacing: true,
            unSelectedColor: Colors.green.withOpacity(0.2),
            unSelectedBorderColor: Colors.green.withOpacity(0.2),
            selectedBorderColor: Colors.green,
            width: 120,
            height: 100,
            buttonLables: [
              '5분전',
              '3분전',
              '1분전',
            ],
            buttonValues: [
              "5",
              "3",
              "1",
            ],
            buttonTextStyle: ButtonTextStyle(
                selectedColor: Colors.black,
                unSelectedColor: Colors.black,
                textStyle: TextStyle(fontSize: 18)),
            radioButtonValue: (value) {
              print(value);
            },
            selectedColor: Colors.green,
          ),
          Text("Submit"),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}