import 'package:flutter/material.dart';
import 'package:imdb_app/locator.dart';
import 'package:imdb_app/models/film.dart';
import 'package:imdb_app/repository/film_repository.dart';


enum FilmDetailState {loading, loaded, error}

class FilmDetailViewModel with ChangeNotifier{
  FilmDetailState? state;
  Film? film;

  FilmDetailViewModel() {
    state = FilmDetailState.loading;
  }

  Future<Film?> getFilmDetails(String imdbId) async {
    var repo = getIt<FilmRepository>();
    
    try {
      state = FilmDetailState.loading;
      film = await repo.getFilmDetail(imdbId);
      state = FilmDetailState.loaded;
      notifyListeners();
      return film;
    } catch (e) {
      print(e);
      state = FilmDetailState.error;
      notifyListeners();
    }
    return film;
  }
  
}