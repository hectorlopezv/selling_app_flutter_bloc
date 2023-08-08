import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_Events.dart';
import 'package:ulearing/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      if (event is WelcomeEvent) {
        emit(WelcomeState(page: state.page));
      }
    });
  }
}
