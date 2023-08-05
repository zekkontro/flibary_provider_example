import 'package:flutter/material.dart';
import 'package:imdb_app/locator.dart';
import 'package:imdb_app/viewmodels/fim_detail_view_model.dart';
import 'package:imdb_app/viewmodels/local_storage_view_model.dart';
import 'package:imdb_app/viewmodels/search_view_model.dart';
import 'package:imdb_app/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilmDetailViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalStorageViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
