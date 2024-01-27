import 'package:bloc2/Ui/counter/counter.dart';
import 'package:bloc2/bloc/counter/counter_bloc.dart';
import 'package:bloc2/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc2/bloc/post/post_bloc.dart';
import 'package:bloc2/bloc/switch_example/switch_bloc.dart';
import 'package:bloc2/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<SwitchBloc>(
          create: (BuildContext context) => SwitchBloc(),
        ),
        BlocProvider<ImagePickerBloc>(
          create: (BuildContext context) => ImagePickerBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(),
        ),
        BlocProvider<PostBloc>(
          create: (BuildContext context) => PostBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Counter(),
      ),
    );
  }
}
