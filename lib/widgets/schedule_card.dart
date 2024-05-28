import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final String title;
  final List people;
  final String start_time;
  final String end_time;
  final Color colors;

  const ScheduleCard(
      {super.key,
      required this.title,
      required this.people,
      required this.start_time,
      required this.end_time,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // CARD
      clipBehavior: Clip.hardEdge, // cut anything overflows
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  start_time.substring(0, 2),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  ),
                ),
                Text(
                  start_time.substring(2, 4),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 0.9,
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  end_time.substring(0, 2),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  ),
                ),
                Text(
                  end_time.substring(2, 4),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 0.9,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                        height: 0.9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var person in people)
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          person.toString().toUpperCase(),
                          style: TextStyle(
                            color: person == 'ME'
                                ? Colors.black
                                : Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
