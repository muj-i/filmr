import 'package:get/get.dart';

import '../modules/bottom_nav_layout/bindings/bottom_nav_layout_binding.dart';
import '../modules/bottom_nav_layout/views/bottom_nav_layout_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAV_LAYOUT;

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
  ];
}
