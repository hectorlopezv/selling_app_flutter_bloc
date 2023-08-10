import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/pages/profile/widgets/build_list_view_profile.dart';
import 'package:ulearing/pages/profile/widgets/profile_app_bar.dart';
import 'package:ulearing/pages/profile/widgets/profile_icon_and_edit_button.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarProfile(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                child: buildListViewProfile(context),
                padding: EdgeInsets.only(
                  left: 25.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
