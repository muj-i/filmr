import 'dart:developer';

import 'package:filmr/app/data/models/movie_detail_credits_model.dart';
import 'package:filmr/app/data/models/movie_detail_recommendation_model.dart';
import 'package:filmr/app/data/models/movie_details_model.dart';
import 'package:filmr/app/data/models/movie_list_trailer_model.dart';
import 'package:filmr/app/data/utils/urls.dart';
import 'package:get/get.dart';

import '../../../data/services/network_caller/request_methods/get_request.dart';

class MovieDetailsController extends GetxController {
  late int? movieId;

  @override
  void onInit() {
    movieId = Get.arguments[0];
    getMoviesList();
    super.onInit();
  }

  filterTrailerAndYoutube() {
    if (movieDetailsTrailerModel.results!.isNotEmpty) {
      for (int i = 0; i < movieDetailsTrailerModel.results!.length; i++) {
        if (movieDetailsTrailerModel.results![i].site == 'YouTube' &&
            movieDetailsTrailerModel.results![i].type == 'Trailer') {
          return movieDetailsTrailerModel.results![i].key;
        }
      }
    }
    return '';
  }

  RxBool isLoading = false.obs;
  MovieDetailsModel movieDetails = MovieDetailsModel();
  MovieDetailsTrailerModel movieDetailsTrailerModel =
      MovieDetailsTrailerModel();

  MovieDetailsRecommendationsModel movieDetailsRecommendationsModel =
      MovieDetailsRecommendationsModel();
  MovieDetailsCreditsModel movieDetailsCreditsModel =
      MovieDetailsCreditsModel();
  Future<bool> getMoviesList() async {
    isLoading.value = true;

    final response =
        await GetRequest.execute(Urls.MOVIE_DETAILS(movieId.toString()));
    final responseTrailer =
        await GetRequest.execute(Urls.MOVIE_TRAILER_URL(movieId.toString()));

    final responseRecommendation = await GetRequest.execute(
        Urls.RECOMMENDATION_MOVIES(movieId.toString()));
    final responseCredits =
        await GetRequest.execute(Urls.MOVIE_CREDITS(movieId.toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      movieDetails = movieDetailsModelFromJson(response.responseData);
      if (responseTrailer.statusCode == 200 ||
          responseTrailer.statusCode == 201) {
        movieDetailsTrailerModel =
            movieDetailsTrailerModelFromJson(responseTrailer.responseData);
      }

      if (responseRecommendation.statusCode == 200 ||
          responseRecommendation.statusCode == 201) {
        movieDetailsRecommendationsModel =
            movieDetailsRecommendationsModelFromJson(
                responseRecommendation.responseData);
        log('movieDetailsSimilarModel: ${movieDetailsRecommendationsModel.results!.length.toString()}');
      }
      if (responseCredits.statusCode == 200 ||
          responseCredits.statusCode == 201) {
        movieDetailsCreditsModel =
            movieDetailsCreditsModelFromJson(responseCredits.responseData);
        log('movieDetailsSimilarModel: ${movieDetailsRecommendationsModel.results!.length.toString()}');
      }
      isLoading.value = false;
      update();
      return true;
    } else {
      isLoading.value = false;
      update();
      return false;
    }
  }
}
