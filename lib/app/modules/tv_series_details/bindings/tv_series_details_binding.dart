import 'package:get/get.dart';

import '../controllers/tv_series_details_controller.dart';

class TvSeriesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvSeriesDetailsController>(
      () => TvSeriesDetailsController(),
    );
  }
}
