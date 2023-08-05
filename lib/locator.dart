import 'package:get_it/get_it.dart';
import 'package:imdb_app/repository/film_repository.dart';
import 'package:imdb_app/viewmodels/fim_detail_view_model.dart';
import 'package:imdb_app/viewmodels/local_storage_view_model.dart';
import 'package:imdb_app/viewmodels/search_view_model.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerSingleton<FilmRepository>(FilmRepository());
  getIt.registerFactory(() => SearchViewModel());
  getIt.registerFactory(() => FilmDetailViewModel());
  getIt.registerFactory(() => LocalStorageViewModel());
}
