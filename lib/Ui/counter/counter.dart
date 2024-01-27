import 'package:bloc2/Ui/image_picker/image_picker.dart';
import 'package:bloc2/Ui/post/post.dart';
import 'package:bloc2/Ui/switch_example/switch.dart';
import 'package:bloc2/Ui/todo/todo.dart';
import 'package:bloc2/bloc/counter/counter_bloc.dart';
import 'package:bloc2/bloc/counter/counter_event.dart';
import 'package:bloc2/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                  child: Text(
                "${state.counter}",
                style: TextStyle(fontSize: 25),
              ));
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounterEvent());
                  },
                  child: Icon(Icons.add)),
              SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounterEvent());
                  },
                  child: Icon(Icons.remove))
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SwitchExample(),
                    ));
              },
              child: Text("Switch")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ImagePicker(),
                    ));
              },
              child: Text("Camera")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => TodoList(),
                    ));
              },
              child: Text("ToDo")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => PostList(),
                    ));
              },
              child: Text("PostList")),
        ],
      ),
    );
  }
}
