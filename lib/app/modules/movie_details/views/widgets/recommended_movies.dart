import 'dart:developer';

import 'package:filmr/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:filmr/app/modules/movie_details/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationMovies extends StatelessWidget {
  const RecommendationMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieDetailsController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recommended Movies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recommendationsResponse?.results?.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height:   20,
                    // margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            // controller.getMovieDetails(controller
                            //     .movieDetailsRecommendationsList[
                            //         controller.index.value]
                            //     .results![index]
                            //     .id);
                            log(controller.index.value.toString());
                            controller.increaseIndex();
                            log(controller.index.value.toString());
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsView(
                                  id: controller.recommendationsResponse
                                      ?.results?[index].id,
                                ),
                              ),
                            );

                            // Get.back();
                            // Future.delayed(
                            //     const Duration(milliseconds: 500),
                            //     () => Get.toNamed(Routes.MOVIE_DETAILS,
                            //             arguments: [
                            //               controller
                            //                   .movieDetailsRecommendationsModel
                            //                   .results?[index]
                            //                   .id
                            //             ]));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    height: 250,
                                    controller
                                                .movieDetailsRecommendationsList[
                                                    controller.index.value]
                                                .results?[index]
                                                .posterPath ==
                                            null
                                        ? 'https://via.placeholder.com/150'
                                        : 'https://image.tmdb.org/t/p/w500${controller.movieDetailsRecommendationsList[controller.index.value].results?[index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    margin:
                                        const EdgeInsets.only(top: 7, right: 7),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.6),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      controller
                                              .movieDetailsRecommendationsList[
                                                  controller.index.value]
                                              .results?[index]
                                              .voteAverage!
                                              .toStringAsFixed(2)
                                              .toString() ??
                                          '',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
