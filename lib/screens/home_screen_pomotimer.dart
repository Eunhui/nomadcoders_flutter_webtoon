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
  int totalSeconds = 0;
  late Timer timer;
  int totalPomodoros = 0; // total round
  int current_minutes = 0;
  int current_seconds = 0;
  int round = 0;
  int goal = 0;
  bool break_time = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0 && break_time == false) {
      setState(() {
        isrunning = false;

        round = round + 1;
        if (round == 4) {
          goal = goal + 1;
          round = 0;
        }
        break_time = true;
      });
    } else if (totalSeconds == 0 && break_time == true && timestart != 0) {
      //break time
      setState(() {
        totalSeconds = 300;
        format(totalSeconds);
        print(current_minutes);
      });
    } else if (totalSeconds == 0 && break_time == true && timestart != 0) {
      //end break time
      totalSeconds = timestart;
      setState(() {
        format(totalSeconds);
        break_time = false;
      });
    } else if (totalSeconds == 0 && goal == 4) {
      isrunning = false;
      totalSeconds = 0;
      timer.cancel();
      setState(() {});
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
        current_minutes = totalSeconds ~/ 60;
        current_seconds = totalSeconds % 60;
      });
    }
  }

  void onStartPressed() {
    //timer
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
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
      timestart = totalSeconds;
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
                      for (int i = 1; i <= 35; i += 5)
                        Container(
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          child: OutlinedButton(
                            onPressed: () {
                              current_minutes = i;
                              current_seconds = 0;
                              round = 0;
                              goal = 0;
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
