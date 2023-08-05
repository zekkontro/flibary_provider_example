import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'rating.dart';

class Film {
  final String Title;
  final String Year;
  final String Rated;
  final String Released;
  final String Runtime;
  final String Genre;
  final String Director;
  final String Writer;
  final String Actors;
  final String Plot;
  final String Language;
  final String Country;
  final String Awards;
  final String Poster;
  final List<Rating> Ratings;
  final String Metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String Type;
  final String DVD;
  final String BoxOffice;
  final String Production;
  final String Website;
  final String Response;
  Film({
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Ratings,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.DVD,
    required this.BoxOffice,
    required this.Production,
    required this.Website,
    required this.Response,
  });

  Film copyWith({
    String? Title,
    String? Year,
    String? Rated,
    String? Released,
    String? Runtime,
    String? Genre,
    String? Director,
    String? Writer,
    String? Actors,
    String? Plot,
    String? Language,
    String? Country,
    String? Awards,
    String? Poster,
    List<Rating>? Ratings,
    String? Metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? Type,
    String? DVD,
    String? BoxOffice,
    String? Production,
    String? Website,
    String? Response,
  }) {
    return Film(
      Title: Title ?? this.Title,
      Year: Year ?? this.Year,
      Rated: Rated ?? this.Rated,
      Released: Released ?? this.Released,
      Runtime: Runtime ?? this.Runtime,
      Genre: Genre ?? this.Genre,
      Director: Director ?? this.Director,
      Writer: Writer ?? this.Writer,
      Actors: Actors ?? this.Actors,
      Plot: Plot ?? this.Plot,
      Language: Language ?? this.Language,
      Country: Country ?? this.Country,
      Awards: Awards ?? this.Awards,
      Poster: Poster ?? this.Poster,
      Ratings: Ratings ?? this.Ratings,
      Metascore: Metascore ?? this.Metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      Type: Type ?? this.Type,
      DVD: DVD ?? this.DVD,
      BoxOffice: BoxOffice ?? this.BoxOffice,
      Production: Production ?? this.Production,
      Website: Website ?? this.Website,
      Response: Response ?? this.Response,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Title': Title,
      'Year': Year,
      'Rated': Rated,
      'Released': Released,
      'Runtime': Runtime,
      'Genre': Genre,
      'Director': Director,
      'Writer': Writer,
      'Actors': Actors,
      'Plot': Plot,
      'Language': Language,
      'Country': Country,
      'Awards': Awards,
      'Poster': Poster,
      'Ratings': Ratings.map((x) => x.toMap()).toList(),
      'Metascore': Metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'Type': Type,
      'DVD': DVD,
      'BoxOffice': BoxOffice,
      'Production': Production,
      'Website': Website,
      'Response': Response,
    };
  }

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      Title: map['Title'] as String,
      Year: map['Year'] as String,
      Rated: map['Rated'] as String,
      Released: map['Released'] as String,
      Runtime: map['Runtime'] as String,
      Genre: map['Genre'] as String,
      Director: map['Director'] as String,
      Writer: map['Writer'] as String,
      Actors: map['Actors'] as String,
      Plot: map['Plot'] as String,
      Language: map['Language'] as String,
      Country: map['Country'] as String,
      Awards: map['Awards'] as String,
      Poster: map['Poster'] as String,
      Ratings: List<Rating>.from((map['Ratings'] as List<dynamic>).map<Rating>((x) => Rating.fromMap(x as Map<String,dynamic>),),),
      Metascore: map['Metascore'] as String,
      imdbRating: map['imdbRating'] as String,
      imdbVotes: map['imdbVotes'] as String,
      imdbID: map['imdbID'] as String,
      Type: map['Type'] as String,
      DVD: map['DVD'] as String,
      BoxOffice: map['BoxOffice'] as String,
      Production: map['Production'] as String,
      Website: map['Website'] as String,
      Response: map['Response'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Film.fromJson(String source) => Film.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Film(Title: $Title, Year: $Year, Rated: $Rated, Released: $Released, Runtime: $Runtime, Genre: $Genre, Director: $Director, Writer: $Writer, Actors: $Actors, Plot: $Plot, Language: $Language, Country: $Country, Awards: $Awards, Poster: $Poster, Ratings: $Ratings, Metascore: $Metascore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbID: $imdbID, Type: $Type, DVD: $DVD, BoxOffice: $BoxOffice, Production: $Production, Website: $Website, Response: $Response)';
  }

  @override
  bool operator ==(covariant Film other) {
    if (identical(this, other)) return true;
  
    return 
      other.Title == Title &&
      other.Year == Year &&
      other.Rated == Rated &&
      other.Released == Released &&
      other.Runtime == Runtime &&
      other.Genre == Genre &&
      other.Director == Director &&
      other.Writer == Writer &&
      other.Actors == Actors &&
      other.Plot == Plot &&
      other.Language == Language &&
      other.Country == Country &&
      other.Awards == Awards &&
      other.Poster == Poster &&
      listEquals(other.Ratings, Ratings) &&
      other.Metascore == Metascore &&
      other.imdbRating == imdbRating &&
      other.imdbVotes == imdbVotes &&
      other.imdbID == imdbID &&
      other.Type == Type &&
      other.DVD == DVD &&
      other.BoxOffice == BoxOffice &&
      other.Production == Production &&
      other.Website == Website &&
      other.Response == Response;
  }

  @override
  int get hashCode {
    return Title.hashCode ^
      Year.hashCode ^
      Rated.hashCode ^
      Released.hashCode ^
      Runtime.hashCode ^
      Genre.hashCode ^
      Director.hashCode ^
      Writer.hashCode ^
      Actors.hashCode ^
      Plot.hashCode ^
      Language.hashCode ^
      Country.hashCode ^
      Awards.hashCode ^
      Poster.hashCode ^
      Ratings.hashCode ^
      Metascore.hashCode ^
      imdbRating.hashCode ^
      imdbVotes.hashCode ^
      imdbID.hashCode ^
      Type.hashCode ^
      DVD.hashCode ^
      BoxOffice.hashCode ^
      Production.hashCode ^
      Website.hashCode ^
      Response.hashCode;
  }
}