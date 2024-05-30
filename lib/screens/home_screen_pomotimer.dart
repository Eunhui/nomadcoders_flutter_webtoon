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
  int totalPomodoros = 0;
  void onStartPressed() {
    //timer
    //timer = Timer.periodic(
    //  const Duration(seconds: 1)
    //  //onTick,
    //);
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
                    TimeImage(date: "25"),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 45,
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                      ),
                    ),
                    TimeImage(date: "15"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Flexible(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      mins(start_time: "15"),
                      mins(start_time: "20"),
                      mins(start_time: "20"),
                      mins(start_time: "20"),
                      mins(start_time: "20"),
                      mins(start_time: "20"),
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
                icon: const Icon(Icons.play_arrow_rounded),
                onPressed: isrunning ? onPausePressed : onStartPressed,
              )),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Round',
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
            ),
          ],
        ),
      ),
    );
  }
}
