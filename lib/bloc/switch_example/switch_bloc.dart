import 'package:bloc2/bloc/switch_example/switch_event.dart';
import 'package:bloc2/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState(enable: true, sliderValue: .5)) {
    on<ToggleNotificationEvent>(_toggle);
    on<onSlideChangeEvent>(_changeSlideValue);
  }

  void _toggle(ToggleNotificationEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(enable: !state.enable));
  }

  void _changeSlideValue(onSlideChangeEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.slideValue));
  }
}
