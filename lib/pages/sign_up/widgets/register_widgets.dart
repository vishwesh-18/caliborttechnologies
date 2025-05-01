import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../comman/values/colors.dart';


AppBar BuildAppBar() {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: AppColors.primaryBackground,
        )),
    title: Text(
      "SignIn",
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget _reuseableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reuseableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
    ),
  );
}

Widget buildTextField(String hintText, String textType, IconData icon, void Function(String? value)? func ) {
  return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryFourElementText),
          borderRadius: BorderRadius.circular(15.w)),
      width: 325.w,
      height: 50.h,
      child: Row(
        children: [
          Container(
            height: 16.h,
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Icon(icon)
          ),
          Container(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged:(value) {
                return func!(value);
              } ,
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.primaryFourElementText),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    height: 44.h,
    width: 260.w,
    child: const Text(
      "Forgot Password",
      style:
      TextStyle(decoration: TextDecoration.underline, color: AppColors.primaryText ),
    ),
  );
}

Widget buildLogInReUseButton(String buttonName, String buttonTpe, void Function()? fuct) {
  return GestureDetector(
    onTap: fuct,
    child: Container(
      margin:EdgeInsets.only(left: 25.w, top: buttonTpe == "login" ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: buttonTpe=="login"?Colors.transparent: AppColors.primaryFourElementText),
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1))
          ],
          color: buttonTpe == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground),
      child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
                color: buttonTpe == "login"
                    ? AppColors.primaryBackground
                    : AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          )),
    ),
  );
}
