import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/app_blocs.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearing/sign_in/bloc/sign_in_blocs.dart';

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
        BlocProvider(create: (context) => SignInBloc())
      ];
}
