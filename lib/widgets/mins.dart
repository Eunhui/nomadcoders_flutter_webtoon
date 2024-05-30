import 'package:flutter/material.dart';

class mins extends StatelessWidget {
  String start_time;

  mins({super.key, required this.start_time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).cardColor,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: Alignment.center,
      child: Text(
        start_time,
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
