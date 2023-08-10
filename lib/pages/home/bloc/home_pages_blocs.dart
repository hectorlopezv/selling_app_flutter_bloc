import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/pages/home/bloc/home_page_events.dart';
import 'package:ulearing/pages/home/bloc/home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(HomePageStates()) {
    on<HomePageDots>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
