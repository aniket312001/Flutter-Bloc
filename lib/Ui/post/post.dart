import 'dart:io';

import 'package:bloc2/bloc/counter/counter_bloc.dart';
import 'package:bloc2/bloc/counter/counter_event.dart';
import 'package:bloc2/bloc/counter/counter_state.dart';
import 'package:bloc2/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc2/bloc/image_picker/image_picker_event.dart';
import 'package:bloc2/bloc/image_picker/image_picker_state.dart';
import 'package:bloc2/bloc/post/post_bloc.dart';
import 'package:bloc2/bloc/post/post_event.dart';
import 'package:bloc2/bloc/post/post_state.dart';
import 'package:bloc2/bloc/switch_example/switch_bloc.dart';
import 'package:bloc2/bloc/switch_example/switch_event.dart';
import 'package:bloc2/bloc/switch_example/switch_state.dart';
import 'package:bloc2/bloc/todo/todo_bloc.dart';
import 'package:bloc2/bloc/todo/todo_event.dart';
import 'package:bloc2/bloc/todo/todo_state.dart';
import 'package:bloc2/model/post_model.dart';
import 'package:bloc2/utils/post_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _TodoListState();
}

class _TodoListState extends State<PostList> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(GetAllPostEvent());

    return Scaffold(
        appBar: AppBar(
          title: Text("PostList "),
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
              Expanded(
                child:
                    BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                  switch (state.status) {
                    case PostStatus.success:
                      return state.posts.length != 0
                          ? RefreshIndicator(
                              onRefresh: () async {
                                context.read<PostBloc>().add(GetAllPostEvent());
                              },
                              child: ListView.builder(
                                itemCount: state.posts.length,
                                itemBuilder: (context, index) {
                                  PostModel post = state.posts[index];
                                  return Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: ListTile(
                                        title: Text(post.title),
                                        subtitle: Text(post.body),
                                      ));
                                },
                              ),
                            )
                          : Center(child: Text("No Data "));
                    case PostStatus.failed:
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    default:
                      return Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ],
          ),
        ));
  }
}
