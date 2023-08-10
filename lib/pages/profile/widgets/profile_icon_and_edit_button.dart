import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget profileIconAndEditButton() {
  return
    Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(right: 6.w),
      child: Image(
        width: 25.w,
        height: 25.h,
        image: AssetImage("assets/icons/edit_3.png"),
      ),
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
          image: AssetImage("assets/icons/headpic.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
}
