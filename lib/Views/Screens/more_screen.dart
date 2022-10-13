import 'package:flutter/material.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'More Screen'),
      ),
      body: const Center(
        child: CustomText(
          text: 'More Screen',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
