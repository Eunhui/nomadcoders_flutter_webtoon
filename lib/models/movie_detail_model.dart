class MovieDetailModel {
  final String title, about;
  final List genre;
  final double star;
  final List runtime;
  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['overview'],
        star = json['vote_average'],
        genre = json['genres'],
        runtime = [(json['runtime'] / 60).toInt(), json['runtime'] % 60];
}
