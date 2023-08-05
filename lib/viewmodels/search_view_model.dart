import 'package:flutter/material.dart';
import 'package:imdb_app/locator.dart';
import 'package:imdb_app/models/query_film.dart';
import 'package:imdb_app/repository/film_repository.dart';

enum SearchState { initial, loading, successfull, error }

class SearchViewModel with ChangeNotifier {
  SearchState? _state;
  List<QueryFilm>? films;
  SearchViewModel() {
    _state = SearchState.initial;
  }

  SearchState get state => _state!;

  set state(SearchState value) {
    _state = value;
    notifyListeners();
  }

  Future<List<QueryFilm>> searchFilm(String filmName) async {
    var repo = getIt<FilmRepository>();
    state = SearchState.initial;

    try {
      state = SearchState.loading;
      films = await repo.queryFilm(filmName);
      state = SearchState.successfull;
    } catch (e) {
      print(e);
      state = SearchState.error;
    }
    return films?? [];
  }
}
