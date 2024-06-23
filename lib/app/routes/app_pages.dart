import 'package:get/get.dart';

import '../modules/bottom_nav_layout/bindings/bottom_nav_layout_binding.dart';
import '../modules/bottom_nav_layout/views/bottom_nav_layout_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_details/bindings/movie_details_binding.dart';
import '../modules/movie_details/views/movie_details_view.dart';
import '../modules/now_playing/bindings/now_playing_binding.dart';
import '../modules/now_playing/views/now_playing_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tv_series_details/bindings/tv_series_details_binding.dart';
import '../modules/tv_series_details/views/tv_series_details_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_LAYOUT,
      page: () => const BottomNavLayoutView(),
      binding: BottomNavLayoutBinding(),
    ),
    GetPage(
      name: _Paths.NOW_PLAYING,
      page: () => const NowPlayingView(),
      binding: NowPlayingBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAILS,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TV_SERIES_DETAILS,
      page: () => const TvSeriesDetailsView(),
      binding: TvSeriesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
