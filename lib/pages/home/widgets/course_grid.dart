import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Best Course for IT and Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourElementText,
            fontSize: 8.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      color: Colors.red,
      image: const DecorationImage(
        image: AssetImage("assets/icons/art.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}
