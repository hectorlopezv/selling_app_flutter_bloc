import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/common/values/colors.dart';
import 'package:ulearing/pages/home/home_page.dart';
import 'package:ulearing/pages/register/register.dart';
import 'package:ulearing/pages/sign_in/sign_in.dart';
import 'package:ulearing/pages/welcome/welcome.dart';
import 'package:ulearing/providers/blocs/blocs_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlockProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          home: const Welcome(),
          routes: {
            '/myHomePage': (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
            "/sign_in": (context) => const SignIn(),
            "/register": (context) => const Register(),
          },
        ),
      ),
    );
  }
}
