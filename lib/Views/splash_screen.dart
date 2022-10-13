// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_demo/AppColors/app_colors.dart';
// import 'package:get/get.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 3), () {
//       Get.offAll(() => const LoginScreen());
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Center(child: Image.asset('lib/assets/images/logo.jpeg')),
//     );
//   }
// }
