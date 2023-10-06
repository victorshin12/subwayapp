// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:subwayapp/subwaylist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedStart;
  String? selectedDestination;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> stations = [
      "홍대입구",
      "청라국제도시",
      "강남",
    ];

    @override
    void dispose() {
      textEditingController.dispose();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        barrierColor: Colors.grey.withOpacity(0.5),
                        hint: Text(
                          '출발지 역 이름',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: stations
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            print("Before: $selectedStart");
                            selectedStart = value;
                            print("After: $selectedStart");
                          });
                        },
                        value: selectedStart,
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 60,
                          width: 280,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 300,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                hintText: '검색...',
                                hintStyle: const TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value.toString().contains(searchValue);
                          },
                        ),
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },
                      ),
                    )),
                Text("도착지", style: TextStyle(fontSize: 24)),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 40),
                    child: Container(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        barrierColor: Colors.grey.withOpacity(0.5),
                        hint: Text(
                          '도착지 역 이름',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: stations
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            print("Before: $selectedDestination");
                            selectedDestination = value;
                            print("After: $selectedDestination");
                          });
                        },
                        value: selectedDestination,
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 60,
                          width: 280,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          maxHeight: 300,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: textEditingController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                hintText: '검색...',
                                hintStyle: const TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value.toString().contains(searchValue);
                          },
                        ),
                        //This to clear the search value when you close the menu
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            textEditingController.clear();
                          }
                        },
                      ),
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
                          MaterialPageRoute(builder: (context) => SubwayList()),
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
