import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/routes/names.dart';
import 'package:ulearing/common/routes/pages.dart';
import 'package:ulearing/common/values/colors.dart';
import 'package:ulearing/global.dart';

Future<void> main() async {
  await GlobalPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...AppPages.allProviders(context),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          initialRoute: AppRoutes.INITIAL,
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
