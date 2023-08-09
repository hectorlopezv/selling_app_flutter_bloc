import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/common/routes/names.dart';
import 'package:ulearing/pages/application/application_page.dart';
import 'package:ulearing/pages/application/bloc/app_bloc.dart';
import 'package:ulearing/pages/register/bloc/register_bloc.dart';
import 'package:ulearing/pages/register/register.dart';
import 'package:ulearing/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearing/pages/sign_in/sign_in.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearing/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.INITIAL,
      page: const Welcome(),
      bloc: BlocProvider(
        create: (_) => WelcomeBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.SIGN_IN,
      page: const SignIn(),
      bloc: BlocProvider(
        create: (_) => SignInBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.REGISTER,
      page: const Register(),
      bloc: BlocProvider(
        create: (_) => RegisterBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.APPLICATION,
      page: const ApplicationPage(),
      bloc: BlocProvider(
        create: (_) => AppBlocs(),
      ),
    ),
  ];

  //return all bloc providers

  static List<dynamic> allProviders(BuildContext context) {
    return <BlocProvider>[
      ...AppPages.routes
          .map((e) => e.bloc)
          .where((element) => element != null)
          .toList(),
    ];
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    //check for route name matching when naviggator gets triggered
    final page =
        AppPages.routes.firstWhere((element) => element.route == settings.name);
    return MaterialPageRoute(
      builder: (_) => page.page,
      settings: settings,
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
