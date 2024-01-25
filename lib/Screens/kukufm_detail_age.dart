import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shoshin_tech_assignment/Screens/home_page.dart';
import 'package:shoshin_tech_assignment/controller/app_controller.dart';

class KukufmPage extends StatelessWidget {
  const KukufmPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(HomePage());
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Offer Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: appController.loadJsonData(),
          builder: (context, data) {return Obx(() {
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
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: Colors.white,
                                        // Set the border color to pink
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 92,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0),
                                            child: Image.network(
                                              items[0]
                                                  .brand!
                                                  .logo
                                                  .toString(),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0.0, bottom: 15),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 200,
                                                child: Text(
                                                  items[0]
                                                      .title
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.73),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0.0,
                                                    right: 100,
                                                    top: 0.0),
                                                child: Container(
                                                  height: 30,
                                                  width: 100,
                                                  child: Text(
                                                    items[0]
                                                        .ctaLong
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 172.0, top: 10.0),
                                                child: Container(
                                                    height: 20,
                                                    width: 40,
                                                    child: RatingBar.builder(
                                                      initialRating: items[0]
                                                              .customdata!
                                                              .apprating ??
                                                          0.0,
                                                      minRating: 1,
                                                      direction: Axis.vertical,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 30.0,
                                                      itemPadding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 0.0,
                                                      ),
                                                      itemBuilder:
                                                          (context, _) => Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 2.0,
                                    endIndent: 30.0,
                                    indent: 30.0,
                                  ),
                                  SizedBox(width: 10, height: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text("Steps (1/4)",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(0.73))),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.all(7.0),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0.0),
                                          child: Container(
                                              child: Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.green,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            height: 30,
                                            width: 260,
                                            child: Text(
                                              detail[0]
                                                  .description
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.73),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(
                                                    11),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                detail[0]
                                                    .payout
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.73),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8),
                                              )),
                                            )),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 140,
                                      margin: EdgeInsets.all(8.0),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2.0),
                                              child: Container(
                                                  child: Icon(
                                                Icons.timer,
                                                color: Colors.orange,

                                              )),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                height: 30,
                                                width: 260,
                                                child: Text(
                                                  detail[0]
                                                      .description
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.73),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 1.0),
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    detail[0]
                                                        .payout
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.73),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 8),
                                                  )),
                                                )),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Container(
                                              height: 70,
                                              width: 300,
                                              child: Text(
                                                items[0]
                                                    .shortDesc
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.all(8.0),
                                      padding: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.white,
                                          // Set the border color to pink
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.0),
                                          child: Container(
                                              child: Icon(
                                            Icons.circle,
                                            color: Colors.grey,
                                            size: 33,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            height: 30,
                                            width: 240,
                                            child: Text(
                                              "Refer KUKUFM to friend",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.73),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                    11),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                detail[0]
                                                    .payout
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8),
                                              )),
                                            )),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, right: 7.0, left: 7.0),
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.all(8.0),
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.0),
                                          child: Container(
                                              child: Icon(
                                            Icons.circle,
                                            color: Colors.grey,
                                            size: 33,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            height: 30,
                                            width: 238,
                                            child: Text(
                                              "Listen to fav Audiobooks & stories",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.73),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1.0),
                                            child: Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(
                                                    11),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                detail[0]
                                                    .payout
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8),
                                              )),
                                            )),
                                      ]),
                                    ),
                                  ),
                                  Container(alignment: Alignment.center,
                                    child: Stack(alignment: Alignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 20.0),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.trending_up_outlined,
                                                  color: Colors.deepOrange),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      items[index]
                                                          .totallead
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.deepOrange,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Text(
                                                  " users has already participated",
                                                  style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40.0, left: 0.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: "Under Development!",
                                                  content: Text(
                                                      "This Feature is not developed yet message to shoshin.tech for more details."));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              height: 40,
                                              width: 270,
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 110.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Get at ₹",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        items[index]
                                                            .payoutamt
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          );}),
    );
  }
}
