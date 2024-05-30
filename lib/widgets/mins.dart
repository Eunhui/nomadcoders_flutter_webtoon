import 'package:flutter/material.dart';

class mins extends StatelessWidget {
  String start_time;

  mins({super.key, required this.start_time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          print('Button  pressed');
        },
        child: Text(
          start_time,
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
