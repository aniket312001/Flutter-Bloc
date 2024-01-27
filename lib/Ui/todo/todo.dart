import 'dart:io';

import 'package:bloc2/bloc/counter/counter_bloc.dart';
import 'package:bloc2/bloc/counter/counter_event.dart';
import 'package:bloc2/bloc/counter/counter_state.dart';
import 'package:bloc2/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc2/bloc/image_picker/image_picker_event.dart';
import 'package:bloc2/bloc/image_picker/image_picker_state.dart';
import 'package:bloc2/bloc/switch_example/switch_bloc.dart';
import 'package:bloc2/bloc/switch_example/switch_event.dart';
import 'package:bloc2/bloc/switch_example/switch_state.dart';
import 'package:bloc2/bloc/todo/todo_bloc.dart';
import 'package:bloc2/bloc/todo/todo_event.dart';
import 'package:bloc2/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TodoList "),
        ),
        // body: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
        //   return
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(
                            AddDataInTodoEvent(data: _textController.text));
                        _textController.clear();
                      },
                      child: Text("Save")),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child:
                    BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
                  return state.totoList.length != 0
                      ? ListView.builder(
                          itemCount: state.totoList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text("${state.totoList[index]}")),
                                  InkWell(
                                      onTap: () {
                                        context.read<TodoBloc>().add(
                                            RemoveDataFromTodoEvent(
                                                data: state.totoList[index]));
                                      },
                                      child: Icon(Icons.delete))
                                ],
                              ),
                            );
                          },
                        )
                      : Center(child: Text("No Data "));
                }),
              ),
            ],
          ),
        ));
  }
}
