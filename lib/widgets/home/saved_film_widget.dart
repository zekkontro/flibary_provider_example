import 'package:flutter/material.dart';
import 'package:imdb_app/models/film.dart';
import 'package:imdb_app/viewmodels/fim_detail_view_model.dart';
import 'package:imdb_app/views/film_detail.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class SavedFilmWidget extends StatelessWidget {
  final Film film;
  const SavedFilmWidget({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        elevation: 10,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                image: film.Poster == "N/A"
                    ? const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/images.png"))
                    : DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(film.Poster))),
            height: context.sized.dynamicHeight(0.3),
            width: context.sized.dynamicWidth(0.45),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            film.Title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }
}
