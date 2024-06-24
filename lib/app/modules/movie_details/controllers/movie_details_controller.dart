import 'dart:developer';

import 'package:filmr/app/data/models/movie_detail_credits_model.dart';
import 'package:filmr/app/data/models/movie_detail_recommendation_model.dart';
import 'package:filmr/app/data/models/movie_details_model.dart';
import 'package:filmr/app/data/models/movie_list_trailer_model.dart';
import 'package:filmr/app/data/utils/urls.dart';
import 'package:get/get.dart';

import '../../../data/services/network_caller/request_methods/get_request.dart';

class MovieDetailsController extends GetxController {
  // late int? movieId;

  // @override
  // void onInit() {
  //   movieId = Get.arguments[0];
  //   getMoviesList();
  //   super.onInit();
  // }
  RxInt index = 0.obs;
  increaseIndex() {
    index.value++;
    update();
  }

  decreaseIndex() {
    if (index.value > 0) {
      index.value--;
    } else {
      index.value = 0;
      movieDetailsList.clear();
      movieDetailsTrailerList.clear();
      movieDetailsRecommendationsList.clear();
      movieDetailsCreditsList.clear();
        
    }
    update();
  }

  String filterTrailerAndYoutube(MovieDetailsTrailerModel trailerModel) {
    if (trailerModel.results!.isNotEmpty) {
      for (int i = 0; i < trailerModel.results!.length; i++) {
        if (trailerModel.results![i].site == 'YouTube' &&
            trailerModel.results![i].type == 'Trailer') {
          return trailerModel.results![i].key!;
        }
      }
    }
    return '';
  }

  RxBool isLoading = true.obs;
  List<MovieDetailsModel> movieDetailsList = <MovieDetailsModel>[].obs;
  List<MovieDetailsTrailerModel> movieDetailsTrailerList =
      <MovieDetailsTrailerModel>[].obs;
  List<MovieDetailsRecommendationsModel> movieDetailsRecommendationsList =
      <MovieDetailsRecommendationsModel>[].obs;
  List<MovieDetailsCreditsModel> movieDetailsCreditsList =
      <MovieDetailsCreditsModel>[].obs;
  MovieDetailsRecommendationsModel? recommendationsResponse =
      MovieDetailsRecommendationsModel();

  Future<bool> getMovieDetails(int movieId) async {
    isLoading.value = true;

    final movieDetailsResponse = await fetchMovieDetails(movieId);
    final trailerResponse = await fetchMovieTrailer(movieId);
    recommendationsResponse = await fetchMovieRecommendations(movieId);
    final creditsResponse = await fetchMovieCredits(movieId);

    if (movieDetailsResponse != null) {
      movieDetailsList.add(movieDetailsResponse);
    }
    if (trailerResponse != null) {
      movieDetailsTrailerList.add(trailerResponse);
    }
    if (recommendationsResponse != null) {
      movieDetailsRecommendationsList.add(recommendationsResponse!);
    }
    if (creditsResponse != null) {
      movieDetailsCreditsList.add(creditsResponse);
    }

    log('movieDetailsRecommendationsList length: ${movieDetailsRecommendationsList.length.toString()}');

    isLoading.value = false;
    update();
    return true;
  }

  Future<MovieDetailsModel?> fetchMovieDetails(int? movieId) async {
    final response =
        await GetRequest.execute(Urls.MOVIE_DETAILS(movieId.toString()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return movieDetailsModelFromJson(response.responseData);
    }
    return null;
  }

  Future<MovieDetailsTrailerModel?> fetchMovieTrailer(int? movieId) async {
    final response =
        await GetRequest.execute(Urls.MOVIE_TRAILER_URL(movieId.toString()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return movieDetailsTrailerModelFromJson(response.responseData);
    }
    return null;
  }

  Future<MovieDetailsRecommendationsModel?> fetchMovieRecommendations(
      int? movieId) async {
    final response = await GetRequest.execute(
        Urls.RECOMMENDATION_MOVIES(movieId.toString()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return movieDetailsRecommendationsModelFromJson(response.responseData);
    }
    return null;
  }

  Future<MovieDetailsCreditsModel?> fetchMovieCredits(int? movieId) async {
    final response =
        await GetRequest.execute(Urls.MOVIE_CREDITS(movieId.toString()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return movieDetailsCreditsModelFromJson(response.responseData);
    }
    return null;
  }
}
