import 'package:flutter/material.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class MediaLibraryScreen extends StatelessWidget {
  const MediaLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Media Library Screen'),
      ),
      body: const Center(
        child: CustomText(
          text: 'Media Library Screen',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
