import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';
import 'package:ulearing/pages/application/bloc/app_bloc.dart';
import 'package:ulearing/pages/application/bloc/app_events.dart';
import 'package:ulearing/pages/application/bloc/app_states.dart';
import 'package:ulearing/pages/application/widgets/build_page.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (index) {
                  context.read<AppBlocs>().add(TriggerAppEvent(index));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primaryElement,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: AppColors.primaryFourElementText,
                items: bottomTabs,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
