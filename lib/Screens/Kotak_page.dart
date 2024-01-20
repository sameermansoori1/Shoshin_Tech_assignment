import 'package:flutter/material.dart';

class Kotak extends StatelessWidget {
  const Kotak({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      width: double.infinity,
    );
  }
}