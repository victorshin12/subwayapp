// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
          backgroundColor: Colors.green, title: const Text("지하철 목록")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                
              ],
            ),
            SubwayCard(),
            SubwayCard(),
            SubwayCard(),
            SubwayCard(),
          ],
        )
      )
    );
  }
}

class SubwayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String station1 = "청라국제도시";
    String station2 = "홍대입구";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(station1 + " --> " + station2,
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
                  Text("도착예정시간: "),
                  Text("9분 42초", style: TextStyle(color: Colors.red)),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: (){
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
