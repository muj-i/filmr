import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/credits.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/detail_view_bittons.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/movie_details_and_overviews.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/recommended_movies.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/trailer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/movie_details_controller.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return controller.isLoading.value
                ? const CircularLoader()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TrailerView(
                              trailerId: controller
                                  .filterTrailerAndYoutube()
                                  .toString()),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: MovieDetailsAndOverview(),
                          ),
                          const MovieCredits(),
                          const RecommendationMovies(),
                        ],
                      ),
                    ),
                  );
          }),
          const DetailsViewButtons(),
        ],
      ),
    );
  }
}
