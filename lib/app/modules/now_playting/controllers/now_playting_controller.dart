import 'package:get/get.dart';

class NowPlaytingController extends GetxController {
final RxInt tabIndex = 0.obs;

  void updateTabIndex(int index) {
    tabIndex.value = index;
  }
}
