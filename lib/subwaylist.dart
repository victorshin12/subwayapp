// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:subwayapp/setalarm.dart';

class SubwayList extends StatefulWidget {
  const SubwayList({super.key});

  @override
  State<SubwayList> createState() => _SubwayListState();
}

class _SubwayListState extends State<SubwayList> {
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
          "지하철 목록",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
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
            child: SingleChildScrollView(
              child: Column(
                      children: [
              SubwayCard(station1: "청라국제도시", station2: "홍대입구"),
              SubwayCard(station1: "청라국제도시", station2: "홍대입구"),
              SubwayCard(station1: "청라국제도시", station2: "홍대입구"),
              SubwayCard(station1: "청라국제도시", station2: "홍대입구"),
              SubwayCard(station1: "청라국제도시", station2: "홍대입구"),
                      ],
                    ),
            )
      )
    )]));
  }
}

class SubwayCard extends StatefulWidget {
  String station1;
  String station2;
  SubwayCard({required this.station1, required this.station2});

  @override
  State<SubwayCard> createState() => _SubwayCardState();
}

class _SubwayCardState extends State<SubwayCard> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(widget.station1 + " → " + widget.station2,
                    style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("36", style: TextStyle(fontSize: 24)),
                  Text("분", style: TextStyle()),
                  Spacer(),
                  Text("2:43", style: TextStyle(fontSize: 24)),
                  Text("도착", style: TextStyle()),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("도착: "),
                  Text("9분 42초", style: TextStyle(color: Colors.red)),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetAlarm()),
                    );
                    print("Subway selected");
                  },
                child: Text("선택")),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
