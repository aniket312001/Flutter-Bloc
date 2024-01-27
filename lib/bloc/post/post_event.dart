import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  CounterEvent() {}

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllPostEvent extends PostEvent {}
