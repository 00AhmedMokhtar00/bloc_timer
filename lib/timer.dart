import 'package:bloc_timer/actions.dart';
import 'package:bloc_timer/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/timer_bloc.dart';
import 'bloc/timer_state.dart';
import 'ticker.dart';

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer Bloc')),
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<TimerBloc, TimerState>(
                builder: (context, state){
                  final String minutesStr = ((state.duration / 60) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, '0');
                  final String secondsStr =
                  (state.duration % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');

                  return Text(
                    '$minutesStr:$secondsStr',
                    style: Timer.timerTextStyle,
                  );
                },
              ),
              BlocBuilder<TimerBloc, TimerState>(
                condition: (previousState, state) =>
                state.runtimeType != previousState.runtimeType,
                builder: (context, state) => ActionButtons(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
