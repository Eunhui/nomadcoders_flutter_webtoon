import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movie = apiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((15)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: Image.network(widget.thumb),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              FutureBuilder(
                future: movie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '${snapshot.data!.star}\n'),
                                TextSpan(
                                    text:
                                        '${snapshot.data!.runtime[0]}h${snapshot.data!.runtime[1]}m | '),
                                for (var genre in snapshot.data!.genre)
                                  TextSpan(text: genre['name'] + ' '),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Story Line',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(snapshot.data!.about),
                        ],
                      ),
                    );
                  }
                  return const Text(',,,');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
