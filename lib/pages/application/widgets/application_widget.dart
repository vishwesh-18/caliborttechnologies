import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../comman/values/colors.dart';
import '../../profile/profile.dart';
import '../../users/users.dart';

Widget BuildPage(int index) {
  List<Widget> widget = [
    UserListScreen(),
    Profile()
  ];
  print("build page called");
  print(index);
  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "home",
      icon: SizedBox(height: 15.h, width: 15.w, child: Icon(Icons.home)),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Icon(
            Icons.home,
            color: AppColors.primaryElement,
          ))),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Icon(Icons.person),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Icon(
            Icons.person,
            color: AppColors.primaryElement,
          ))),
];
