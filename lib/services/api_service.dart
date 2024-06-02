import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_model.dart';

class apiService {
  static const String popular =
      'https://movies-api.nomadcoders.workers.dev/popular';

  static Future<List<movieModel>> get_popular_movie() async {
    List<movieModel> movieInstances = [];
    final url = Uri.parse(popular);
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
}
