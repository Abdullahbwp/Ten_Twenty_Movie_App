import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_demo/AppColors/app_colors.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Dash Board Screen'),
      ),
      body: Center(
        child: CustomText(
            text: 'Dash Board Screen',
            fontWeight: FontWeight.bold,
            size: 15.sp,
            color: AppColors.blackColor),
      ),
    );
  }
}
