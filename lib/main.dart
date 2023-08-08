import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearing/pages/home/home_page.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearing/pages/welcome/welcome.dart';
import 'package:ulearing/sign_in/sign_in.dart';

import 'app_blocs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          // lazy: false,
          create: (context) => AppBlocs(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          home: const Welcome(),
          routes: {
            '/myHomePage': (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
            "/sign_in": (context) => const SignIn(),
          },
        ),
      ),
    );
  }
}
