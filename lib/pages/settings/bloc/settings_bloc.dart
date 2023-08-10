import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearing/pages/settings/bloc/settings_events.dart';
import 'package:ulearing/pages/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvents event, Emitter<SettingsStates> emit) {
    emit(SettingsStates());
  }
}
