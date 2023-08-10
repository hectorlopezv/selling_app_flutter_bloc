import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';
import 'package:ulearing/pages/home/bloc/home_page_states.dart';
import 'package:ulearing/pages/home/bloc/home_pages_blocs.dart';
import 'package:ulearing/pages/home/widgets/build_app_bar.dart';
import 'package:ulearing/pages/home/widgets/course_grid.dart';
import 'package:ulearing/pages/home/widgets/home_page_text.dart';
import 'package:ulearing/pages/home/widgets/menu_view.dart';
import 'package:ulearing/pages/home/widgets/search_view.dart';
import 'package:ulearing/pages/home/widgets/sliders_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarHome(),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: homePageText(
                  "Hello,",
                  color: AppColors.primaryThreeElementText,
                  top: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: homePageText(
                  "Welcome Back,",
                  color: AppColors.primaryText,
                  top: 5,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: searchView()),
              SliverToBoxAdapter(child: slidersView(context, state)),
              SliverToBoxAdapter(child: menuView()),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0.w),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: courseGrid(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
