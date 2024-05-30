import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenPomotimer extends StatefulWidget {
  const HomeScreenPomotimer({super.key});

  @override
  State<HomeScreenPomotimer> createState() => _HomeScreenPomotimerState();
}

class _HomeScreenPomotimerState extends State<HomeScreenPomotimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
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
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: 150,
                              height: 150,
                              color: Colors.blue,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 120,
                              height: 120,
                              color: Colors.yellow.withOpacity(0.8),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      fontSize: 45,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: 150,
                              height: 150,
                              color: Colors.blue,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 120,
                              height: 120,
                              color: Colors.yellow.withOpacity(0.8),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Text(
                'DATE',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
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
    );
  }
}
