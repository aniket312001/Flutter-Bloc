import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> totoList;
  TodoState({this.totoList = const []});

  TodoState copyWith({List<String>? totoList}) {
    print("called copywith ${totoList.toString()}");
    return TodoState(totoList: totoList ?? this.totoList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [totoList];
}
