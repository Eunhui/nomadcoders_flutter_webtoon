class movieModel {
  final String title, thumb, id;

  movieModel.fromJson(Map<String, dynamic> json,
      {String poster = 'poster_path'})
      : title = json['title'],
        thumb = 'https://image.tmdb.org/t/p/w500/' + json[poster],
        id = json['id'].toString();
}
