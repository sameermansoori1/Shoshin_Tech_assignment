import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/Screens/Kotak_page.dart';
import 'package:shoshin_tech_assignment/Screens/RageCoffe_page.dart';
import 'package:shoshin_tech_assignment/Screens/detail_page.dart';
import 'package:shoshin_tech_assignment/Screens/kukufm_detail_age.dart';
import 'package:shoshin_tech_assignment/controller/app_controller.dart';
import 'package:shoshin_tech_assignment/models/detail_model.dart';
import 'package:shoshin_tech_assignment/models/tasks_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.snackbar("Menu button under development",
                  "This Feature is not developed yet message to shoshin.tech for more details.");
            },
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          title: Text(
            "Hey Shumbham",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Wallet is UnderDevelopment!",
                      content: Text(
                          "This Feature is not developed yet message to shoshin.tech for more details."));
                },
                icon: Icon(
                  Icons.wallet_rounded,
                  color: Colors.blue,
                ),
                label: Text(
                  "₹ 450",
                  style: TextStyle(color: Colors.black54),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
            future: appController.loadJsonData(),
            builder: (context, data) {
              return Obx(() {
                if (appController.taskModels.isEmpty ||
                    appController.detailModels.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var items = appController.taskModels;
                var detail = appController.detailModels; //
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: "Updating Soon!",
                                                  content: Center(
                                                    child: Text(
                                                        "All Offer section Functionality should be added soon."),
                                                  ),
                                                  backgroundColor:
                                                      Colors.blueAccent);
                                            },
                                            icon: Icon(
                                              Icons.add_alert,
                                              size: 35,
                                              color: Colors.blue,
                                            )),
                                        SizedBox(height: 2),
                                        Text("All Offers",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 33),
                                  Container(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: "Updating Soon!",
                                                  content: Text(
                                                      "Gift section Functionality should be added soon."),
                                                  backgroundColor:
                                                      Colors.blueAccent);
                                            },
                                            icon: Icon(
                                              Icons.wallet_giftcard,
                                              size: 35,
                                              color: Colors.pinkAccent,
                                            )),
                                        SizedBox(height: 2),
                                        Text("Gifts",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.pinkAccent)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 33),
                                  Container(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: "Updating Soon!",
                                                  content: Text(
                                                      "Upcoming section Functionality should be added soon."),
                                                  backgroundColor:
                                                      Colors.blueAccent);
                                            },
                                            icon: Icon(
                                              Icons.access_time,
                                              size: 35,
                                              color: Colors.deepOrange,
                                            )),
                                        SizedBox(height: 2),
                                        Text("Upcoming",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.deepOrange)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 33),
                                  Container(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: "Updating Soon!",
                                                  content: Text(
                                                      "My Offer section Functionality should be added soon."),
                                                  backgroundColor:
                                                      Colors.blueAccent);
                                            },
                                            icon: Icon(
                                              Icons.check_circle_outline,
                                              size: 35,
                                              color: Colors.deepPurpleAccent,
                                            )),
                                        SizedBox(height: 3),
                                        Text("My Offers",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    Colors.deepPurpleAccent)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      color: Colors.lightBlue.shade100,
                      child: Stack(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                  height: 20,
                                  width: double.infinity,
                                  color: Colors.grey.shade300,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 20.0,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        viewportFraction: 0.68),
                                    items: items.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      TaskModel task = items[index];
                                      DetailModel detailInfo = detail[index];
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.circle,
                                                      size: 12,
                                                      color: Color(int.parse(
                                                              task.customdata!
                                                                  .dominantcolor!
                                                                  .substring(1),
                                                              radix: 16) +
                                                          0xFF000000)),
                                                  Text(
                                                    task.title ??
                                                        "", // Add this line to display shortDesc
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              ));
                                        },
                                      );
                                    }).toList(),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Colors.deepOrange,
                                    size: 40,
                                  ),
                                  Text(
                                    "Trending Offers",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 185.0,
                                  autoPlay: true,
                                  initialPage: 1,
                                  viewportFraction: 0.6,
                                  padEnds: false,
                                ),
                                items: items.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  TaskModel task = items[index];
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          switch (index) {
                                            case 0:
                                              Get.to(KukufmPage());
                                              break;
                                            case 1:
                                              Get.to(Kotak());
                                              break;
                                            case 2:
                                              Get.to(RageCoffe());
                                              break;

                                            default:
                                              break;
                                          }
                                          //Get.to(DetailPage(index: index));

                                        },
                                        child: Stack(
                                            fit: StackFit.passthrough,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Container(
                                                  width: 185,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 0.0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white),
                                                  child: Image.network(
                                                    task.customdata!.wallurl ??
                                                        "",
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 115.0),
                                                width: 185,
                                                decoration: BoxDecoration(
                                                    color: Colors.black38,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20))),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      task.title ?? "",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                      task.ctaLong ?? "",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      task.payout ?? "",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.snackbar(
                                          "More offer section is in development phase",
                                          "This Feature is not developed yet message to shoshin.tech for more details.");
                                    },
                                    child: Icon(
                                      Icons.menu_open_rounded,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                  Text(
                                    "More Offers",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // List<Color> borderColors = [
                                      //   Colors.pink,
                                      //   Colors.indigo,
                                      //   Colors.black,
                                      //   // Add more colors as needed
                                      // ];
                                      Color borderColor = Color(int.parse(
                                              items[index]
                                                  .customdata!
                                                  .dominantcolor!
                                                  .substring(1),
                                              radix: 16) +
                                          0xFF000000);
                                      return GestureDetector(
                                        onTap: () {
                                          switch (index) {
                                            case 0:
                                              Get.to(KukufmPage());
                                              break;
                                            case 1:
                                              Get.to(Kotak());
                                              break;
                                            case 2:
                                              Get.to(RageCoffe());
                                              break;
                                            // Add more cases as needed
                                            default:
                                              // Handle default case
                                              break;
                                          }
                                          //Get.to(DetailPage(index: index));
                                        },
                                        child: Container(
                                          height: 77,
                                          margin: EdgeInsets.all(8.0),
                                          padding: EdgeInsets.all(18.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: borderColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 65,
                                                child: Image.network(
                                                  items[index]
                                                      .brand!
                                                      .logo
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1.0),
                                                    child: Container(
                                                      child: Text(
                                                        items[index]
                                                            .brand!
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: 80,
                                                      height: 18,
                                                      child: ElevatedButton(
                                                          onPressed: () {},
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                            ),
                                                            side: MaterialStateProperty
                                                                .all(BorderSide(
                                                                    color: Colors
                                                                        .blue)),
                                                          ),
                                                          child: Text(
                                                            items[index]
                                                                .payout
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70.0, top: 18),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .trending_up_outlined,
                                                        color:
                                                            Colors.deepOrange),
                                                    Container(
                                                      child: Text(
                                                        items[index]
                                                            .totallead
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepOrange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ))
                  ],
                );
              });
            }));
  }
}
//Color(int.parse(task.customdata!.dominantcolor!.substring(1), radix: 16) + 0xFF000000)
