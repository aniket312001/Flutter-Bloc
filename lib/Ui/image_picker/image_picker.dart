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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _CounterState();
}

class _CounterState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        // body: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
        //   return
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                  buildWhen: (previous, current) =>
                      previous.file != current.file,
                  builder: (context, state) {
                    return state.file != null
                        ? Container(
                            child: Container(
                            child:
                                Image(image: FileImage(File(state.file!.path))),
                          ))
                        : Text("No image ");
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImagePickerBloc>()
                            .add(GalleryImagePickerEvent());
                      },
                      child: Text("Gallery")),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<ImagePickerBloc>()
                            .add(CameraImagePickerEvent());
                      },
                      child: Text("Camera")),
                ],
              )
            ],
          ),
        ));
  }
}
