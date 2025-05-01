import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_text_widget.dart';

AppBar BuildAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          reusableText(title),
          SizedBox(
            width: 24.w,
            height: 24.h,
            // child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}
