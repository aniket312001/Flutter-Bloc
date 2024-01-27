import 'package:bloc2/bloc/counter/counter_bloc.dart';
import 'package:bloc2/bloc/counter/counter_event.dart';
import 'package:bloc2/bloc/counter/counter_state.dart';
import 'package:bloc2/bloc/switch_example/switch_bloc.dart';
import 'package:bloc2/bloc/switch_example/switch_event.dart';
import 'package:bloc2/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _CounterState();
}

class _CounterState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Switch example"),
        ),
        // body: BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
        //   return
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Notification")),
                  BlocBuilder<SwitchBloc, SwitchState>(
                      buildWhen: (previous, current) =>
                          previous.enable != current.enable,
                      builder: (context, state) {
                        return Container(
                          child: Switch(
                            value: state.enable,
                            onChanged: (value) {
                              context
                                  .read<SwitchBloc>()
                                  .add(ToggleNotificationEvent());
                            },
                          ),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.sliderValue != current.sliderValue,
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          height: 200,
                          color: Colors.red.withOpacity(state.sliderValue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Slider(
                            value: state.sliderValue,
                            onChanged: (val) {
                              context
                                  .read<SwitchBloc>()
                                  .add(onSlideChangeEvent(slideValue: val));
                            })
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}
