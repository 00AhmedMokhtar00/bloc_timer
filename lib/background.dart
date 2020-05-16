import 'package:bloc_timer/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
    builder: (context, state){
      return Align(
        alignment: Alignment.bottomCenter,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [
                Color.fromRGBO(72, 74, 126, 1),
                Color.fromRGBO(125, 170, 206, 1),
                Color.fromRGBO(184, 189, 245, 0.7)
              ],
              [
                Color.fromRGBO(72, 74, 126, 1),
                Color.fromRGBO(125, 170, 206, 1),
                Color.fromRGBO(172, 182, 219, 0.7)
              ],
              [
                Color.fromRGBO(72, 73, 126, 1),
                Color.fromRGBO(125, 170, 206, 1),
                Color.fromRGBO(190, 238, 246, 0.7)
              ],
            ],
            durations: [19440, 10800, 6000],
            heightPercentages: [0.03, 0.01, 0.02],
            gradientBegin: Alignment.bottomCenter,
            gradientEnd: Alignment.topCenter,
          ),
          size: Size(double.infinity, MediaQuery.of(context).size.height * (state.duration / 60) ),
          waveAmplitude: 25,
          //backgroundColor: Colors.blue[50],
        ),
      );
    }

    );
  }
}
