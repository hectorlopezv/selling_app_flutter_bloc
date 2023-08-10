import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';
import 'package:ulearing/pages/home/bloc/home_page_events.dart';
import 'package:ulearing/pages/home/bloc/home_page_states.dart';
import 'package:ulearing/pages/home/bloc/home_pages_blocs.dart';

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (index) {
            context.read<HomePageBloc>().add(HomePageDots(index));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/Image_2.png"),
          ],
        ),
      ),
      SizedBox(height: 10.h),
      Container(
        child: DotsIndicator(
          position: state.index,
          dotsCount: 3,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeSize: const Size(17, 5),
            size: const Size.square(5.0),
          ),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        image: AssetImage(path),
      ),
    ),
  );
}
