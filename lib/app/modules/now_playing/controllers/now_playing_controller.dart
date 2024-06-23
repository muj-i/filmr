import 'package:filmr/app/data/models/movies_list_model.dart';
import 'package:filmr/app/data/models/tv_series_list_model.dart';
import 'package:filmr/app/data/services/network_caller/request_methods/get_request.dart';
import 'package:filmr/app/data/utils/urls.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  final RxInt tabIndex = 0.obs;

  void updateTabIndex(int index) {
    tabIndex.value = index;
  }

  RxBool isShowsListLoading = false.obs;
  MoviesListModel moviesNowPlayingList = MoviesListModel();
  TvSeriesListModel tvSeriesNowPlayingList = TvSeriesListModel();

  Future<bool> getNowPlayingMoviesList() async {
    isShowsListLoading.value = true;

    final response = await GetRequest.execute(Urls.NOW_PLAYING_MOVIES);

    if (response.statusCode == 200 || response.statusCode == 201) {
      moviesNowPlayingList = moviesListModelFromJson(response.responseData);
      isShowsListLoading.value = false;
      update();
      return true;
    } else {
      isShowsListLoading.value = false;
      update();
      return false;
    }
  }
}
