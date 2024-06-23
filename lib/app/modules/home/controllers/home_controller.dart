import 'package:filmr/app/data/models/movies_list_model.dart';
import 'package:filmr/app/data/models/search_list_model.dart';
import 'package:filmr/app/data/models/tv_series_list_model.dart';
import 'package:filmr/app/data/services/network_caller/request_methods/get_request.dart';
import 'package:filmr/app/data/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final RxInt tabIndex = 0.obs;

  void updateTabIndex(int index) {
    tabIndex.value = index;
  }

  RxBool isShowsListLoading = false.obs;
  MoviesListModel moviesList = MoviesListModel();
  TvSeriesListModel tvSeriesList = TvSeriesListModel();

  Future<bool> getMoviesList() async {
    isShowsListLoading.value = true;

    final response = await GetRequest.execute(Urls.POPULAR_MOVIES);

    if (response.statusCode == 200 || response.statusCode == 201) {
      moviesList = moviesListModelFromJson(response.responseData);
      isShowsListLoading.value = false;
      update();
      return true;
    } else {
      isShowsListLoading.value = false;
      update();
      return false;
    }
  }

  Future<bool> getTvSeriesList() async {
    isShowsListLoading.value = true;

    final response = await GetRequest.execute(Urls.POPULAR_TV_SERIES);

    if (response.statusCode == 200 || response.statusCode == 201) {
      tvSeriesList = tvSeriesListModelFromJson(response.responseData);
      isShowsListLoading.value = false;
      update();
      return true;
    } else {
      isShowsListLoading.value = false;
      update();
      return false;
    }
  }

  RxBool isSearchListLoading = false.obs;
  final Rx<TextEditingController> searchController =
      TextEditingController().obs;
  SearchListModel searchList = SearchListModel();

  Future<bool> searchlistfunction() async {
    isSearchListLoading.value = true;
    update();
    final response = await GetRequest.execute(
        Urls.SEARCH_URL(searchController.value.text.toLowerCase().toString()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      searchList = searchListModelFromJson(response.responseData);
      isSearchListLoading.value = false;
      update();
      return true;
    } else {
      isSearchListLoading.value = false;
      update();
      return false;
    }
  }
}
