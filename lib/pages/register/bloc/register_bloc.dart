import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/pages/register/bloc/register_events.dart';
import 'package:ulearing/pages/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>(
      (event, emit) => _userNamEvent(event, emit),
    );
    on<EmailEvent>(
      (event, emit) => _emailEvent(event, emit),
    );
    on<PasswordEvent>(
      (event, emit) => _passwordEvent(event, emit),
    );
    on<ConfirmPasswordEvent>(
      (event, emit) => _confirmPasswordEvent(event, emit),
    );
  }

  void _userNamEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
