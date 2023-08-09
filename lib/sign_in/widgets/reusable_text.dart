import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}
