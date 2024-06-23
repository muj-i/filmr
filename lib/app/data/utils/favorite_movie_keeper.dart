import 'package:filmr/app/data/models/movie_details_model.dart';
import 'package:hive/hive.dart';

// part 'favourite_movies_keeper.g.dart';

// @HiveType(typeId: 0)
// class MovieDetailsModel {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String title;
//   // Add other fields as necessary

//   MovieDetailsModel(this.id, this.title);
// }

class FavouriteMoviesKeeper {
// BreakingNewsLocalDataStorage._();

  static Box<MovieDetailsModel>? _dataBox;

  static Future<void> init() async {
    if (_dataBox == null) {
      await Hive.openBox<MovieDetailsModel>('favMoviesDataBox');
      _dataBox = await Hive.openBox<MovieDetailsModel>('favMoviesDataBox');
    }
  }

  static Future<void> saveMovieDetails(
      MovieDetailsModel favMovieDetailsModel) async {
    await init();
    // await _dataBox?.clear();
    await _dataBox?.addAll([favMovieDetailsModel]);
    // log(favMovieDetailsModel.length.toString());
  }

  static Future<List<MovieDetailsModel>> getMovieDetailsDatabase() async {
    final box = await Hive.openBox<MovieDetailsModel>('favMoviesDataBox');
    return box.values.toList();
  }

  static Future<void> clearDatabase() async {
    final box = await Hive.openBox<MovieDetailsModel>('favMoviesDataBox');
    await box.clear();
  }
}
