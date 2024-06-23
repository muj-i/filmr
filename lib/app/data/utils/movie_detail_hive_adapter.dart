import 'dart:convert';

import 'package:filmr/app/data/models/movie_details_model.dart';
import 'package:hive/hive.dart';

class MovieDetailsHiveAdapter extends TypeAdapter<MovieDetailsModel> {
  @override
  final typeId = 0;

  @override
  MovieDetailsModel read(BinaryReader reader) {
    final Map<String, dynamic> json = jsonDecode(reader.read());
    return MovieDetailsModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, MovieDetailsModel obj) {
    final jsonStr = jsonEncode(obj.toJson());
    writer.write(jsonStr);
  }
}