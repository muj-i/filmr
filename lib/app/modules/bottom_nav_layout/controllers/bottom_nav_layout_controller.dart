import 'package:filmr/app/modules/home/views/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavLayoutController extends GetxController {
  final List<Widget> screens = [
    const HomeView(),
    const Text('gfgdfrtrtrg'),
    const Text('gfgdfg'),
  ];

  RxInt selectedIndex = 0.obs;
  void changeScreen(int index) {
    selectedIndex.value = index;
    update();
  }
}
