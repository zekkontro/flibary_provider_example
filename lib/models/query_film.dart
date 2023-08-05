class QueryFilm {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  QueryFilm(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.poster});

  factory QueryFilm.fromJson(Map<String, dynamic> json) {
    var title = json['Title'];
    var year = json['Year'];
    var imdbID = json['imdbID'];
    var type = json['Type'];
    var poster = json['Poster'];
    
    return QueryFilm(title: title, year: year, imdbID: imdbID, type: type, poster: poster);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
