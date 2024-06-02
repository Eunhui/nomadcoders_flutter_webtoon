import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String title, thumb, id;
  final bool popular;
  const Movie({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    required this.popular,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          (popular
              ? Container(
                  width: 250,
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20)),
                  ),
                  child: Image.network(thumb),
                )
              : Container(
                  width: 150,
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((15)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  child: Image.network(thumb),
                )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
