import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_demo/AppColors/app_colors.dart';
import 'package:test_demo/Controller/utills_controller.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class GetTicketsScreen extends StatefulWidget {
  const GetTicketsScreen({Key? key}) : super(key: key);

  @override
  State<GetTicketsScreen> createState() => _GetTicketsScreenState();
}

class _GetTicketsScreenState extends State<GetTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    var utillsController = Get.put(UtillsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        toolbarHeight: 110.h,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'The King’s Man',
                size: 16.sp,
                color: AppColors.textColor,
              ),
              CustomText(
                text: 'In theaters december 22, 2021',
                color: AppColors.lightBlueColor,
                size: 12.sp,
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.backGroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Date',
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                        size: 16.sp,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 40.h,
                    child: ListView.builder(
                      itemCount: utillsController.monthList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              utillsController.selectIndex.value = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 80.w,
                            decoration: BoxDecoration(
                                color:
                                    utillsController.selectIndex.value == index
                                        ? AppColors.lightBlueColor
                                        : Color(0xffA6A6A6).withOpacity(0.20),
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Center(
                              child: CustomText(
                                text: utillsController.monthList[index],
                                size: 13.sp,
                                fontWeight: FontWeight.w600,
                                color:
                                    utillsController.selectIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: '12:30',
                            color: AppColors.textColor,
                            size: 12.sp,
                          ),
                          CustomText(
                            text: " Cinetech + hall 1",
                            size: 12.sp,
                            color: AppColors.lightBlackColor,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: '13:30',
                            color: AppColors.textColor,
                          ),
                          CustomText(
                            text: " Cinetech + hall 1",
                            size: 12.sp,
                            color: AppColors.lightBlackColor,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 150.h,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10.w),
                          width: 260.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.lightBlueColor),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 10.w, left: 10.w, top: 10.h),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 20,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: 54,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBlueColor,
                                        borderRadius:
                                            BorderRadius.circular(15.sp)),
                                  );
                                }),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomText(
                            text: 'From ',
                            color: AppColors.lightBlackColor,
                          ),
                          CustomText(
                            text: '\$50',
                            color: AppColors.textColor,
                            size: 12.sp,
                          ),
                          const CustomText(
                            text: 'or ',
                            color: AppColors.lightBlackColor,
                          ),
                          CustomText(
                            text: " 2500 bonus",
                            size: 12.sp,
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: 'From ',
                            color: AppColors.lightBlackColor,
                          ),
                          CustomText(
                            text: '\$50',
                            color: AppColors.textColor,
                            size: 12.sp,
                          ),
                          CustomText(
                            text: 'or ',
                            color: AppColors.lightBlackColor,
                          ),
                          CustomText(
                            text: " 2500 bonus",
                            size: 12.sp,
                            color: AppColors.textColor,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
        child: Container(
          height: 45.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.lightBlueColor,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Center(
            child: CustomText(
              text: 'Select Seats',
              color: AppColors.whiteColor,
              size: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
