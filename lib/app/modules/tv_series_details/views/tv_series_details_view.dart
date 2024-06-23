import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tv_series_details_controller.dart';

class TvSeriesDetailsView extends GetView<TvSeriesDetailsController> {
  const TvSeriesDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TvSeriesDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TvSeriesDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
