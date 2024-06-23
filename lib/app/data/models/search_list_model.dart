// To parse this JSON data, do
//
//     final searchListModel = searchListModelFromJson(jsonString);

import 'dart:convert';

SearchListModel searchListModelFromJson(String str) =>
    SearchListModel.fromJson(json.decode(str));

String searchListModelToJson(SearchListModel data) =>
    json.encode(data.toJson());

class SearchListModel {
  int? page;
  List<Result>? results;

  SearchListModel({
    this.page,
    this.results,
  });

  factory SearchListModel.fromJson(Map<String, dynamic> json) =>
      SearchListModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? title;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? originalName;
  String? name;
  DateTime? firstAirDate;
  // List<String>? originCountry;
  dynamic gender;

  Result({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.title,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.originalName,
    this.name,
    this.firstAirDate,
    // this.originCountry,
    this.gender,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        adult: json["adult"],
        title: json["title"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originalName: json["original_name"],
        name: json["name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        // originCountry: json["origin_country"] == null
        //     ? []
        //     : List<String>.from(json["origin_country"]!.map((x) => x)),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "title": title,
        "original_language": originalLanguage,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "original_name": originalName,
        "name": name,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        // "origin_country": originCountry == null
        // ? []
        // : List<dynamic>.from(originCountry!.map((x) => x)),
        "gender": gender,
      };
}
