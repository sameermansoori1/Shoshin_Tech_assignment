import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/Screens/home_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Get.to(HomePage());},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Offer Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              width: double.infinity,
            ),
          ),
        ),],
      ),

    );
  }
}
