import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int? top}) {
  return Container(
    margin: EdgeInsets.only(top: top == null ? 0.h : top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
