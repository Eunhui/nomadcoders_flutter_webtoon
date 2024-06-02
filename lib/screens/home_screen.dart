import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<movieModel>> movies = apiService.get_popular_movie();
  final Future<List<movieModel>> now_playing = apiService.get_now_movie();
  final Future<List<movieModel>> coming_soon = apiService.get_future_movie();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Column(
            children: [
              const Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: movies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(child: makeList(snapshot, popular: true)),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const Text(
                'Now In Cinemas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: now_playing,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(child: makeList(snapshot)),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: coming_soon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(child: makeList(snapshot)),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<movieModel>> snapshot,
      {popular = false}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = snapshot.data![index];
        return Movie(
            title: movie.title,
            thumb: movie.thumb,
            id: movie.id,
            popular: popular);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
