import 'package:flutter/material.dart';

class date extends StatelessWidget {
  final String text;

  const date({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.4),
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
