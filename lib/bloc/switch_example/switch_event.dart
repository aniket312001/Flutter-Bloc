import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleNotificationEvent extends SwitchEvent {}

class onSlideChangeEvent extends SwitchEvent {
  final double slideValue;
  onSlideChangeEvent({required this.slideValue});
  @override
  List<Object> get props => [slideValue];
}
