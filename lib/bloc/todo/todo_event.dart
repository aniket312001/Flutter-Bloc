import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  ImagePickerEvents() {}
}

class AddDataInTodoEvent extends TodoEvents {
  final String data;
  AddDataInTodoEvent({required this.data});
  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class RemoveDataFromTodoEvent extends TodoEvents {
  final String data;
  RemoveDataFromTodoEvent({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
