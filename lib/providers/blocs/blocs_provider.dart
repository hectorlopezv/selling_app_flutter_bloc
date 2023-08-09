import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/app_blocs.dart';
import 'package:ulearing/pages/register/bloc/register_bloc.dart';
import 'package:ulearing/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlockProviders => [
        BlocProvider(
          // lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          // lazy: false,
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ];
}
