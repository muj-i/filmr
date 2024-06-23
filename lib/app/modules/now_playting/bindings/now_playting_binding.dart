import 'package:get/get.dart';

import '../controllers/now_playting_controller.dart';

class NowPlaytingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NowPlaytingController>(
      () => NowPlaytingController(),
    );
  }
}
