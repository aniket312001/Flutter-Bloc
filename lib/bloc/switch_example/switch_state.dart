import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool enable;
  final double sliderValue;

  SwitchState({this.enable = false, this.sliderValue = 0});

  SwitchState copyWith({bool? enable, double? sliderValue}) {
    return SwitchState(
        enable: enable ?? this.enable,
        sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [enable, sliderValue];
}
