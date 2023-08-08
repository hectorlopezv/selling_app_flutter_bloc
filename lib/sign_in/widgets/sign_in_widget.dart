import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        //height defines the thickes fo the line
        height: 1,
      ),
    ),
    title: Center(
      child: Text(
        "Log In",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}

Widget reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
        fit: BoxFit.cover,
      ),
    ),
  );
}

// we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcons("google"),
        reusableIcons("facebook"),
        reusableIcons("apple"),
      ],
    ),
  );
}

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

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.w),
        ),
        border: Border.all(color: Colors.black)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == "login" ? 0.h : 20.h),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
