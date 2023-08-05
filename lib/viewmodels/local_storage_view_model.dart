import 'package:flutter/material.dart';
import 'package:imdb_app/models/film.dart';
import 'package:shared_preferences/shared_preferences.dart';

const savedFilmsPath = "savedFilms";

class LocalStorageViewModel with ChangeNotifier {
  SharedPreferences? preferences;
  List<Film> savedFilms = [];
  Future initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    notifyListeners();
  }

  getSavedFilms() {
    List<String> receivedFilms =
        preferences!.getStringList(savedFilmsPath) ?? [];

    if (receivedFilms.isNotEmpty) {
      List<Film> films = receivedFilms.map((e) => Film.fromJson(e)).toList();
      savedFilms = films;
    }
    notifyListeners();
  }

  saveFilm(Film film) {
    savedFilms.add(film);
    preferences!.setStringList(
        savedFilmsPath, savedFilms.map((e) => e.toJson()).toList());

    notifyListeners();
  }
}
