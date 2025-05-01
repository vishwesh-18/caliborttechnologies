import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../comman/values/colors.dart';

Widget buildTextField(String hintText, IconData? iconName, VoidCallback? onTap,
    {void Function(String? value)? func, TextEditingController? controller}) {
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
            // height: 16.h,
            // width: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Icon(iconName),
          ),
          Container(
            width: 270.w,
            height: 50.h,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                return func!(value);
              },
              autocorrect: false,
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

Widget buildReUseButton(String buttonName, void Function()? fuct) {
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

Widget profileIconsAdnEditBtn(
    String avtarUrl, File? imageFile, void Function()? fuct) {
  print(imageFile);
  return Container(

    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    child: GestureDetector(
      onTap: fuct,
      child: const Icon(
        Icons.camera,
        color: Colors.white,
      ),
    ),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: imageFile != null
            ? FileImage(imageFile) as ImageProvider
            : NetworkImage(avtarUrl),
      ),
    ),
  );
}
