import 'package:bloc2/bloc/todo/todo_event.dart';
import 'package:bloc2/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  TodoBloc() : super(TodoState(totoList: const [])) {
    on<AddDataInTodoEvent>(_add);
    on<RemoveDataFromTodoEvent>(_remove);
  }

  void _add(AddDataInTodoEvent event, Emitter<TodoState> emit) {
    List<String> data = List.from(state.totoList);
    data.add(event.data);

    emit(state.copyWith(totoList: data));
  }

  void _remove(RemoveDataFromTodoEvent event, Emitter<TodoState> emit) {
    List<String> data = List.from(state.totoList);
    data.remove(event.data);

    emit(state.copyWith(totoList: data));
  }
}
