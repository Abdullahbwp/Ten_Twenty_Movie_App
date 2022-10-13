import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_demo/AppColors/app_colors.dart';
import 'package:test_demo/Controller/api_controller.dart';
import 'package:test_demo/Models/movie_model.dart';
import 'package:test_demo/Views/Screens/watch_details_screen.dart';
import 'package:test_demo/Widgets/api_configration.dart';
import 'package:test_demo/Widgets/custom_text.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  TextEditingController searchController = TextEditingController();
  bool searchSelect = false;
  var controller = Get.find<Controller>();

  bool showSearchedListWidget = false;

  @override
  void initState() {
    controller.movieListingMethod();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        searchMovies(searchController.text.trim());
        setState(() {
          showSearchedListWidget = true;
        });
      } else {
        showSearchedListWidget = false;
      }
    });
    super.initState();
  }

  List<MoviesModel> moviesList = [
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Thor"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Avengers"),
    MoviesModel(
        image: "lib/assets/images/Rectangle.png", name: "Infinity Wars"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Devdas"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Black Adam"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Fall"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Paws of fury"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Tenor"),
    MoviesModel(
        image: "lib/assets/images/Rectangle.png", name: "Into the deep"),
    MoviesModel(
        image: "lib/assets/images/Rectangle.png", name: "The women king"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Vesper"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Barbarian"),
    MoviesModel(image: "lib/assets/images/Rectangle.png", name: "Masterdam"),
  ];

  List<MoviesModel> searchedList = [];

  searchMovies(String text) {
    searchedList.clear();
    setState(() {});
    for (var i = 0; i < moviesList.length; i++) {
      if (moviesList[i].name!.toLowerCase().contains(text.toLowerCase())) {
        searchedList.add(moviesList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      child: !searchSelect
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Watch',
                                  size: 16.sp,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchSelect = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    color: AppColors.blackColor,
                                  ),
                                )
                              ],
                            )
                          : Container(
                              height: 50.h,
                              width: 370.w,
                              decoration: BoxDecoration(
                                  color: AppColors.lightWhitColor,
                                  borderRadius: BorderRadius.circular(30.sp)),
                              child: TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'TV shows, movies and more',
                                    hintStyle: TextStyle(
                                        color: AppColors.hintColor
                                            .withOpacity(0.30)),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 22.sp,
                                      color: AppColors.blackColor,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        searchController.clear();
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: AppColors.blackColor,
                                      ),
                                    )),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.lightWhitColor,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            searchSelect && searchController.text.isEmpty
                                ? gridViewCustom()
                                : showSearchedListWidget
                                    ? searchListView()
                                    : ListView.builder(
                                        itemCount:
                                            controller.moviesResultList.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          print(
                                              'image pathe>>$imageBaseUrl${controller.moviesResultList[index].posterPath.toString()}');
                                          return GestureDetector(
                                            onTap: () async {
                                              controller.isLoading.value = true;
                                              bool check = await controller
                                                  .movieListingDetailsMethod(
                                                      movieId: controller
                                                          .moviesResultList[
                                                              index]
                                                          .id!
                                                          .toInt());
                                              controller.isLoading.value =
                                                  false;
                                              if (check) {
                                                log('log printed Id is == ${controller.moviesResultList[index].id}');
                                                Get.to(() => WatchDetailsScreen(
                                                    imageId: controller
                                                            .moviesResultList[
                                                                index]
                                                            .posterPath ??
                                                        "https://image.tmdb.org/t/p/w500/kJpXG8DLfwstSYjn3EJJ5rppj79.jpg"));
                                              }
                                            },
                                            child: controller
                                                        .moviesResultList[index]
                                                        .posterPath ==
                                                    null
                                                ? Image.asset(
                                                    'lib/assets/images/Rectangle.png')
                                                : Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w,
                                                            vertical: 10.h),
                                                    height: 180.h,
                                                    width: 382.w,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                '$imageBaseUrl${controller.moviesResultList[index].posterPath.toString()}'),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.sp),
                                                        color: AppColors
                                                            .whiteColor),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: CustomText(
                                                          text: controller
                                                                  .moviesResultList[
                                                                      index]
                                                                  .title ??
                                                              "Not define",
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          size: 16.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          );
                                        },
                                      ),
                            const SizedBox(
                              height: 170,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget gridViewCustom() {
    return Container(
      // height: 690.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GridView.builder(
            itemCount: moviesList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            moviesList[index].image!,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.sp),
                      color: AppColors.whiteColor),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomText(
                          text: moviesList[index].name,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget searchListView() {
    return ListView.builder(
      itemCount: searchedList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110.h,
                width: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.sp),
                  child: Image.asset(
                    searchedList[index].image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          constraints: const BoxConstraints(
                              maxHeight: double.infinity,
                              maxWidth: double.infinity),
                          child: CustomText(
                            text: searchedList[index].name,
                            color: Colors.black,
                          )),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.lightBlueColor,
                        ),
                      ),
                      CustomText(
                        text: 'A Time to kill',
                        color: AppColors.lighthintColor,
                        size: 12.sp,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
