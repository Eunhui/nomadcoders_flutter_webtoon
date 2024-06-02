import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<movieModel> movies = [];
  bool isLoading = true;
  void waitForMovies() async {
    movies = await apiService.get_popular_movie();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitForMovies();
  }

  @override
  Widget build(BuildContext context) {
    print(movies);
    print(isLoading);
    return const Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
