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
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  start_time.substring(0, 2),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  start_time.substring(2, 4),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  end_time.substring(0, 2),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  end_time.substring(2, 4),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
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
