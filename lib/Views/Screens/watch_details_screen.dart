import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_demo/AppColors/app_colors.dart';
import 'package:test_demo/Controller/api_controller.dart';
import 'package:test_demo/Views/Screens/get_tickets_screen.dart';
import 'package:test_demo/Views/Screens/watch_trailer_screen.dart';
import 'package:test_demo/Widgets/api_configration.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class WatchDetailsScreen extends StatefulWidget {
  final String imageId;
  const WatchDetailsScreen({Key? key, required this.imageId}) : super(key: key);

  @override
  State<WatchDetailsScreen> createState() => _WatchDetailsScreenState();
}

class _WatchDetailsScreenState extends State<WatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Controller>();
    var colorList = [
      AppColors.lightBlueColor,
      Color(0xffE26CA5),
      Color(0xff564CA3),
      Color(0xffCD9D0F)
    ];
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.generesList.isEmpty
                ? Center(
                    child: CustomText(
                      text: 'No Record Found',
                      size: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 430.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '$imageBaseUrl${widget.imageId}'),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      const CustomText(
                                        text: 'Watch',
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 160.h,
                                ),
                                SizedBox(
                                  height: 30.h,
                                  width: 102.w,
                                  child: Image.asset(
                                    'lib/assets/images/king.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const CustomText(
                                  text: 'In theaters december 22, 2021',
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const GetTicketsScreen());
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBlueColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: CustomText(
                                        text: 'Get Tickets',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => WatchTrailerScreen());
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.lightBlueColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_right_sharp,
                                          color: AppColors.whiteColor,
                                          size: 30.sp,
                                        ),
                                        const CustomText(
                                          text: 'Watch Trailer',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: 'Genres',
                                      color: AppColors.textColor,
                                      size: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.generesList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        width: 65.w,
                                        decoration: BoxDecoration(
                                            color: colorList[index],
                                            borderRadius:
                                                BorderRadius.circular(20.sp)),
                                        child: Center(
                                          child: CustomText(
                                            text: controller
                                                    .generesList[index].name ??
                                                "Not define",
                                            size: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                CustomText(
                                  text: 'Overview',
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  size: 16.sp,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                        maxWidth: double.infinity),
                                    child: CustomText(
                                      text: controller.detailsModelObject.value
                                              .overview ??
                                          "Not define",
                                      color: AppColors.lightBlackColor,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
