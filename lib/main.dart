import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';
import 'package:toonflix/widgets/date.dart';
import 'package:toonflix/widgets/schedule_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('lib/image/grumpy_frog.jpeg'),
                      radius: 30,
                    ),
                    Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Monday 16',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'TODAY',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '⦁',
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const date(text: '17'),
                      const SizedBox(width: 20),
                      const date(text: '18'),
                      const SizedBox(width: 20),
                      const date(text: '19'),
                      const SizedBox(width: 20),
                      const date(text: '20'),
                      const SizedBox(width: 20),
                      const date(text: '21'),
                      const SizedBox(width: 20),
                      const date(text: '22'),
                      const SizedBox(width: 20),
                      const date(text: '23'),
                      const SizedBox(width: 20),
                      const date(text: '24'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const ScheduleCard(
                  title: 'DESIGN\nMEETING',
                  people: ['Alex', 'Helena', 'NANA'],
                  colors: Colors.yellow,
                  start_time: '1130',
                  end_time: '1220',
                ),
                const SizedBox(height: 10),
                const ScheduleCard(
                  title: 'DAILY\nPROJECT',
                  people: ['ME', 'RICHARD', 'CIRY', '+4'],
                  colors: Colors.purple,
                  start_time: '1235',
                  end_time: '1410',
                ),
                const SizedBox(height: 10),
                const ScheduleCard(
                  title: 'WEEKLY\nPLANNING',
                  people: ['DEN', 'NANA', 'MARK'],
                  colors: Colors.green,
                  start_time: '1500',
                  end_time: '1630',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
