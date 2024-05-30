import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/time_image.dart';

class HomeScreenPomotimer extends StatefulWidget {
  const HomeScreenPomotimer({super.key});

  @override
  State<HomeScreenPomotimer> createState() => _HomeScreenPomotimerState();
}

class _HomeScreenPomotimerState extends State<HomeScreenPomotimer> {
  bool isrunning = false;
  int timestart = 0;
  int totalSeconds = 0;
  late Timer timer;
  int totalPomodoros = 0; // total round
  int current_minutes = 0;
  int current_seconds = 0;
  int round = 0;
  int goal = 0;
  bool break_time = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0 && goal == 4) {
      //real end
      setState(() {
        isrunning = false;
        break_time = false;
        goal = 0;
        round = 0;
        totalSeconds = timestart;
        format(totalSeconds);
      });
      timer.cancel();
    } else if (totalSeconds == 0 &&
        break_time == false &&
        goal != 4 &&
        timestart != 0) {
      //each end, break starts
      setState(() {
        round = round + 1;
        if (round == 4) {
          goal = goal + 1;
          round = 0;
        }
        totalSeconds = 300;
        format(totalSeconds);
      });
      break_time = true;
    } else if (totalSeconds == 0 &&
        break_time == true &&
        goal != 4 &&
        timestart != 0) {
      //end break time
      totalSeconds = timestart;
      setState(() {
        format(totalSeconds);
        break_time = false;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
        format(totalSeconds);
      });
    }
  }

  void onStartPressed() {
    if (totalSeconds == 0) return;
    //timer
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      onTick,
    );
    setState(() {
      isrunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isrunning = false;
    });
  }

  void onSetTimer() {
    setState(() {
      totalSeconds = current_minutes * 60 + current_seconds;
      format(totalSeconds);
    });
  }

  void onReset() {
    if (isrunning) timer.cancel();
    setState(() {
      isrunning = false;
      if (break_time) {
        totalSeconds = 300;
        format(totalSeconds);
      } else {
        totalSeconds = timestart;
        format(totalSeconds);
      }
    });
  }

  void format(int seconds) {
    var duration = Duration(seconds: seconds);
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    current_minutes = min;
    current_seconds = sec;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeImage(date: current_minutes.toString()),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 45,
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                      ),
                    ),
                    TimeImage(date: current_seconds.toString()),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.1, 0.9, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 5; i <= 35; i += 5)
                          Container(
                            padding: const EdgeInsets.all(4),
                            alignment: Alignment.center,
                            child: OutlinedButton(
                              onPressed: () {
                                timestart = i * 60;
                                current_minutes = i;
                                current_seconds = 0;
                                round = 0;
                                goal = 0;
                                break_time = false;
                                onSetTimer();
                              },
                              child: Text(
                                '$i',
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 100,
                      color: Theme.of(context).cardColor,
                      icon: Icon(isrunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline),
                      onPressed: isrunning ? onPausePressed : onStartPressed,
                    ),
                    IconButton(
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      icon: const Icon(Icons.replay_rounded),
                      onPressed: onReset,
                    ),
                    if (break_time)
                      Text(
                        'Break Time!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).cardColor),
                      )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$round/4',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Round',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$goal/4',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Goal',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
