// ignore_for_file: constant_identifier_names, non_constant_identifier_names

abstract class Urls {
  Urls._();

  static const String _APIKEY = "cd890f94a756b1518a2a17617a5b430e";
  static const String _BASE_URL = "https://api.themoviedb.org/3";

  static const String POPULAR_MOVIES =
      "$_BASE_URL/movie/popular?api_key=$_APIKEY";
  static const String POPULAR_TV_SERIES =
      "$_BASE_URL/tv/popular?api_key=$_APIKEY";
  static const String NOW_PLAYING_MOVIES = "$_BASE_URL/movie/now_playing?api_key=$_APIKEY";
  static const String NOW_PLAYING_TV_SERIES = "$_BASE_URL/tv/now_playing?api_key=$_APIKEY";


  static String SEARCH_URL(String value) =>
      "$_BASE_URL/search/multi?api_key=$_APIKEY&query=$value";
}
