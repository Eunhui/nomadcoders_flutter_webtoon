import 'package:flutter/material.dart';

class mins extends StatelessWidget {
  String start_time;

  mins({super.key, required this.start_time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).cardColor,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        start_time,
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
