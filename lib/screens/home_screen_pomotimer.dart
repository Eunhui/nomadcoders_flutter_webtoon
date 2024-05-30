import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/mins.dart';
import 'package:toonflix/widgets/time_image.dart';

class HomeScreenPomotimer extends StatefulWidget {
  const HomeScreenPomotimer({super.key});

  @override
  State<HomeScreenPomotimer> createState() => _HomeScreenPomotimerState();
}

class _HomeScreenPomotimerState extends State<HomeScreenPomotimer> {
  bool isrunning = false;
  int timestart = 0;
  int totalSeconds = 100;
  late Timer timer;
  int totalPomodoros = 0; // total round
  int current_minutes = 0;
  int current_seconds = 0;
  int round = 0;
  int goal = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isrunning = false;
        totalSeconds = timestart;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    //timer
    timer = Timer.periodic(
      const Duration(seconds: 1),
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

  void format(int seconds) {
    var duration = Duration(seconds: seconds);
    print(duration);
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
              flex: 3,
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
            const SizedBox(height: 20),
            Flexible(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 15; i <= 35; i += 5) mins(start_time: '$i'),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                  child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                icon: Icon(isrunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
                onPressed: isrunning ? onPausePressed : onStartPressed,
              )),
            ),
            Flexible(
              flex: 2,
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
                          'Goal',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '$goal/4',
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
