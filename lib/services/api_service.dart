import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/movie_model.dart';

class apiService {
  static const String popular =
      'https://movies-api.nomadcoders.workers.dev/popular';
  static const String now =
      'https://movies-api.nomadcoders.workers.dev/now-playing';
  static const String coming =
      'https://movies-api.nomadcoders.workers.dev/coming-soon';
  static const String detail =
      'https://movies-api.nomadcoders.workers.dev/movie?id=';
  static Future<List<movieModel>> get_popular_movie() async {
    List<movieModel> movieInstances = [];
    final url = Uri.parse(popular);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieList = jsonDecode(response.body);
      for (var movie in movieList['results']) {
        movieInstances.add(movieModel.fromJson(movie, poster: 'backdrop_path'));
      }
      return movieInstances;
    } else {
      throw Error();
    }
  }

  static Future<List<movieModel>> get_now_movie() async {
    List<movieModel> movieInstances = [];
    final url = Uri.parse(now);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieList = jsonDecode(response.body);
      for (var movie in movieList['results']) {
        movieInstances.add(movieModel.fromJson(movie));
      }
      return movieInstances;
    } else {
      throw Error();
    }
  }

  static Future<List<movieModel>> get_future_movie() async {
    List<movieModel> movieInstances = [];
    final url = Uri.parse(coming);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieList = jsonDecode(response.body);
      for (var movie in movieList['results']) {
        movieInstances.add(movieModel.fromJson(movie));
      }
      return movieInstances;
    } else {
      throw Error();
    }
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    final url = Uri.parse('$detail$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    } else {
      throw Error();
    }
  }
}
