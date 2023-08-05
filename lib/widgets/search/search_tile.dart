import 'package:flutter/material.dart';
import 'package:imdb_app/models/query_film.dart';
import 'package:imdb_app/viewmodels/fim_detail_view_model.dart';
import 'package:imdb_app/viewmodels/local_storage_view_model.dart';
import 'package:imdb_app/views/film_detail.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class SearchTile extends StatelessWidget {
  final QueryFilm film;
  const SearchTile({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<FilmDetailViewModel>(context, listen: false)
            .getFilmDetails(film.imdbID);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FilmDetail(),
            ));
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: film.poster == "N/A"
                      ? const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/images.png"))
                      : DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(film.poster))),
              height: context.sized.dynamicHeight(0.2),
              width: context.sized.dynamicWidth(0.3),
            ),
            SizedBox(
              width: context.sized.dynamicWidth(0.6),
              child: Column(
                children: [
                  Text(
                    film.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${film.year} / ${film.type.toUpperCase()}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                      IconButton(
                          onPressed: () {
                            Provider.of<FilmDetailViewModel>(context,
                                    listen: false)
                                .getFilmDetails(film.imdbID)
                                .then((value) {
                              Provider.of<LocalStorageViewModel>(context,
                                      listen: false)
                                  .saveFilm(
                                      Provider.of<FilmDetailViewModel>(context, listen: false)
                                          .film!);
                            });
                          },
                          icon: const Icon(Icons.bookmark_outline))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
