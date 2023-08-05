import 'package:flutter/material.dart';
import 'package:imdb_app/viewmodels/search_view_model.dart';
import 'package:imdb_app/widgets/search/search_tile.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final _searchViewModel = Provider.of<SearchViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            onSubmitted: (value) {
              if (_searchController.text.isNotEmpty) {
                _searchViewModel.searchFilm(_searchController.text);
              } else {
                debugPrint("field empty");
              }
            },
            controller: _searchController,
            decoration: InputDecoration(
                hintText: "Ara...",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      if (_searchController.text.isNotEmpty) {
                        _searchViewModel.searchFilm(_searchController.text);
                      } else {
                        debugPrint("field empty");
                      }
                    },
                    icon: const Icon(Icons.search))),
          ),
        ),
        body: Builder(
          builder: (context) {
            if (_searchViewModel.state == SearchState.successfull) {
              return ListView(
                children: _searchViewModel.films!
                    .map<Widget>((e) => SearchTile(film: e))
                    .toList(),
              );
            } else if (_searchViewModel.state == SearchState.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (_searchViewModel.state == SearchState.initial) {
              return Center(
                child: Text("Lütfen bir film aratınız"),
              );
            } else {
              return Center(child: Text("Aranan filme ulaşılamadı"));
            }
          },
        ));
  }
}
