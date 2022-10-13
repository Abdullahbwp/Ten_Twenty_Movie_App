import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_demo/AppColors/app_colors.dart';
import 'package:test_demo/Views/Screens/dash_board_screen.dart';
import 'package:test_demo/Views/Screens/get_tickets_screen.dart';
import 'package:test_demo/Views/Screens/media_library_screen.dart';
import 'package:test_demo/Views/Screens/more_screen.dart';

// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:test_demo/Views/Screens/watch_screen.dart';
import 'package:test_demo/Widgets/custom_text.dart';

bool goback = true;

class BottomSheetCustom extends StatelessWidget {
  BottomSheetCustom({Key? key}) : super(key: key);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    showExitPopup(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: CustomText(
                  text: 'ARE YOU SURE TO EXIT FROM APP?',
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: CustomText(
                        text: 'NO',
                      )),
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: CustomText(
                        text: 'YES',
                      ))
                ],
              ));
      //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: () async {
        if (goback) {
          print('Now showing dialog');
          showExitPopup(context);
          return false;
        } else {
          return true;
        }
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        selectedTabScreenContext: (context) {},

        screens: _buildScreens(),
        items: _navBarsItems(),

        confineInSafeArea: true,
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  0.15,
                ),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),

        backgroundColor: Color(0xff2E2739),
        // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          // curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          // curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple,
        onItemSelected: (v) {
          if (v == 0 && !goback) {
            goback = true;
            print('Now showing dialog');
            //showExitPopup(context);
          } else {
            goback = false;
          }
        },
        // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      DashBoardScreen(),
      WatchScreen(),
      MediaLibraryScreen(),
      MoreScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.dashboard_rounded,
          size: 22,
        ),
        title: ("Dashboard"),
        activeColorPrimary: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        inactiveColorPrimary: Color(0xff827D88),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.ondemand_video_rounded),
        title: ("Watch"),
        activeColorPrimary: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        inactiveColorPrimary: Color(0xff827D88),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.perm_media_outlined),
        title: ("Media Library"),
        activeColorPrimary: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        inactiveColorPrimary: Color(0xff827D88),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.format_list_bulleted_rounded),
        title: ("More"),
        activeColorPrimary: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w500),
        inactiveColorPrimary: Color(0xff827D88),
      ),
    ];
  }
}
