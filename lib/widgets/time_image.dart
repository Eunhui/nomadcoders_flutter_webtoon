import 'package:flutter/material.dart';

class TimeImage extends StatelessWidget {
  final double opacity = 5;
  String date;
  TimeImage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(opacity),
                  color: Colors.white,
                ),
                width: 150,
                height: 170,
              ),
            ),
            Positioned(
              top: -5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(opacity),
                  color: Colors.white.withOpacity(0.8),
                ),
                width: 130,
                height: 130,
              ),
            ),
            Positioned(
              top: -10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(opacity),
                  color: Colors.white.withOpacity(0.4),
                ),
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              top: 30,
              child: Text(
                date,
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
