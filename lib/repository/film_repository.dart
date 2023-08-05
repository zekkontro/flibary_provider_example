import 'dart:convert';

import 'package:imdb_app/models/film.dart';
import 'package:imdb_app/models/query_film.dart';
import 'package:http/http.dart' as http;
class FilmRepository {
  static const baseUrl = "http://www.omdbapi.com/";
  static const API_KEY = "e4d00211";

  Future<List<QueryFilm>> queryFilm(String query) async {
    String url = "$baseUrl?apikey=$API_KEY&s=$query&plot=full&r=json&tomatoes=True";
    var res =  await http.get(Uri.parse(url));
    List<QueryFilm> queryFilms = (jsonDecode(res.body)['Search'] as List).map((e) => QueryFilm.fromJson(e)).toList();
    return queryFilms;
  }

  Future<Film> getFilmDetail(String imdbId) async {
    String url = "$baseUrl?apikey=$API_KEY&i=$imdbId&plot=full&r=json&tomatoes=True";
    
    var res =  await http.get(Uri.parse(url));

    return Film.fromJson(res.body);

  }
}