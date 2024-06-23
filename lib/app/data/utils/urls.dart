// ignore_for_file: constant_identifier_names, non_constant_identifier_names

abstract class Urls {
  Urls._();

  static const String _APIKEY = "cd890f94a756b1518a2a17617a5b430e";
  static const String _BASE_URL = "https://api.themoviedb.org/3";

  static const String POPULAR_MOVIES =
      "$_BASE_URL/movie/popular?api_key=$_APIKEY";
  static const String  TOP_RATED_MOVIES =
      "$_BASE_URL/movie/top_rated?api_key=$_APIKEY";
  static const String UPCOMING_MOVIES =
      "$_BASE_URL/movie/upcoming?api_key=$_APIKEY";
 

  static const String NOW_PLAYING_MOVIES =
      "$_BASE_URL/movie/now_playing?api_key=$_APIKEY";

  static String SEARCH_URL(String value) =>
      "$_BASE_URL/search/movie?api_key=$_APIKEY&query=$value";

  static String MOVIE_DETAILS(String id) =>
      "$_BASE_URL/movie/$id?api_key=$_APIKEY";
  static String MOVIE_TRAILER_URL(String id) =>
      '$_BASE_URL/movie/$id/videos?api_key=$_APIKEY';

  static String RECOMMENDATION_MOVIES(String id) =>
      '$_BASE_URL/movie/$id/recommendations?api_key=$_APIKEY';
  static String MOVIE_CREDITS(String id) =>
      "$_BASE_URL/movie/$id/credits?api_key=$_APIKEY";
}
