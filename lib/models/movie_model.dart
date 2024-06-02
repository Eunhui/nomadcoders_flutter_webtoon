class movieModel {
  final String title, thumb, id;

  movieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['poster_path'],
        id = json['id'].toString();
}
