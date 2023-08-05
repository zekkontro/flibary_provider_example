import 'package:flutter/material.dart';
import 'package:imdb_app/viewmodels/fim_detail_view_model.dart';
import 'package:imdb_app/viewmodels/local_storage_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class FilmDetail extends StatelessWidget {
  const FilmDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var detailViewModel = Provider.of<FilmDetailViewModel>(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Provider.of<LocalStorageViewModel>(context, listen: false)
              .saveFilm(detailViewModel.film!);
          Navigator.pop(context);
        },
        child: Container(
          width: context.sized.dynamicWidth(0.4),
          height: context.sized.dynamicHeight(0.05),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: InkWell(
              child: Center(
                  child: Text(
            "Save",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ))),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: detailViewModel.state == FilmDetailState.loaded
            ? Text(
                detailViewModel.film!.Title,
                style: const TextStyle(color: Colors.white),
              )
            : Container(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Builder(
            builder: (context) {
              if (detailViewModel.state == FilmDetailState.loaded) {
                var film = detailViewModel.film!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: film.Poster == "N/A"
                                ? const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/image/images.png"))
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(film.Poster))),
                        height: context.sized.dynamicHeight(0.4),
                        width: context.sized.dynamicWidth(0.6),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        film.Title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Actors: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            film.Actors,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Director: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            film.Director,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Writer: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            film.Writer,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Released: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            film.Released,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Awards: ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            film.Awards,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ...film.Ratings.map((rating) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  rating.Source,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  rating.Value,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Summary ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(film.Plot),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: context.sized.dynamicHeight(0.06),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
