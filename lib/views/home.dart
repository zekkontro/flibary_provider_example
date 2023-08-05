import 'package:flutter/material.dart';
import 'package:imdb_app/viewmodels/local_storage_view_model.dart';
import 'package:imdb_app/views/search.dart';
import 'package:imdb_app/widgets/home/saved_film_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<LocalStorageViewModel>(context, listen: false)
        .initPreferences()
        .then((value) {
      Provider.of<LocalStorageViewModel>(context, listen: false)
          .getSavedFilms();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var savedViewModel = Provider.of<LocalStorageViewModel>(context);

    return Scaffold(
      body: savedViewModel.savedFilms.isEmpty
          ? const Center(
              child: Text(
                "There are no saved movies",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: [
                ...savedViewModel.savedFilms
                    .map((e) => SavedFilmWidget(film: e))
              ],
            ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
        backgroundColor: Colors.yellow,
        title: Text(
          "Flibary",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
    );
  }
}
