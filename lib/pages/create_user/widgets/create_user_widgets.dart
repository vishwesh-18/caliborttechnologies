import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../comman/values/colors.dart';
import '../../../comman/widgets/base_text_widget.dart';

Widget userBuildTextField(
    String hintText, IconData? iconName, VoidCallback? onTap,
    {void Function(String? value)? func,
    TextEditingController? controller,
    TextInputType textInputType = TextInputType.multiline}) {
  return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryFourElementText),
          borderRadius: BorderRadius.circular(15.w)),
      width: 325.w,
      height: 50.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20.h,
            width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: GestureDetector(onTap: onTap, child: Icon(iconName)),
          ),
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 270.w,
            height: 50.h,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                if (func != null) func!(value);
              },
              autocorrect: false,
              keyboardType: textInputType,
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
          ),
        ],
      ));
}

Widget createReUseButton(String buttonName, void Function()? fuct) {
  return GestureDetector(
    onTap: fuct,
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryElement),
          borderRadius: BorderRadius.circular(15.w),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1))
          ],
          color: AppColors.primaryElement),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      )),
    ),
  );
}

Widget reusablePickImageButton(
  IconData icon, {
  Color textColor = AppColors.primaryElementText,
  Color backGroundColor = AppColors.primaryElement,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(7.w),
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),


      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backGroundColor,
        // borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: backGroundColor),
      ),
      padding: EdgeInsets.all(15.w),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
  );
}

Widget pickedImageWidget(
  File imageFile, {
  Color backGroundColor = AppColors.primaryElement,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(7.w),
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backGroundColor,
        border: Border.all(color: backGroundColor),
      ),
      padding: EdgeInsets.all(15.w),
      child: Center(
          child: Image.file(
        imageFile!,
        fit: BoxFit.fitWidth,
      )),
    ),
  );
}

Widget reusableManuText(String manuText,
    {Color textColor = AppColors.primaryElementText,
      Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    // margin: EdgeInsets.only(right: 20.h),
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backGroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.w, bottom: 5.w),
    child: reusableText(manuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}