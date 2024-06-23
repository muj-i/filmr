import 'package:filmr/app/modules/home/views/home_view.dart';
import 'package:filmr/app/modules/now_playting/views/now_playting_view.dart';
import 'package:filmr/app/modules/user_profile/views/user_profile_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavLayoutController extends GetxController {
  final List<Widget> screens = [
    const HomeView(),
    const NowPlaytingView(),
    const UserProfileView(),
  ];

  RxInt selectedIndex = 1.obs;
  void changeScreen(int index) {
    selectedIndex.value = index;
    update();
  }
}
