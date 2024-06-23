// import 'package:filmr/app/data/models/movie_details_model.dart';
// import 'package:hive/hive.dart';

// class FavouriteMoviesKeeper {
//   static List? _favouriteMovies;

//   static List? get favouriteMovies => _favouriteMovies;

//   static Future<void> setFavouriteMovies(MovieDetailsModel favMovList) async {
//     final HiveList hiveList = HiveList(Hive.box('favouriteMovies'));
//     hiveList.addAll(favMovList);
//   }

//   static Future<void> getFavouriteMovies() async {
//     final HiveList hiveList = HiveList(Hive.box('favouriteMovies'));
//     _favouriteMovies = hiveList;
//   }

//   static Future<void> clear() async {
//     await Hive.box('favouriteMovies').clear();
//     _favouriteMovies = null;
//   }
// }
