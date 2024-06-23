import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/movie_details/views/widgets/trailer_view.dart';
import 'package:filmr/app/routes/app_pages.dart';
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
                          const SimilarMovies(),
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

class MovieDetailsAndOverview extends StatelessWidget {
  const MovieDetailsAndOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieDetailsController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 52,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.movieDetails.genres?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.movieDetails.genres?[index].name ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                controller.movieDetails.title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'Rating: ${controller.movieDetails.voteAverage?.toStringAsPrecision(2).toString() ?? ''}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Overview:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          controller.movieDetails.overview ?? '',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieDetailsController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Similar Movies', style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 400,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    controller.movieDetailsSimilarModel.results?.length ?? 0,
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
                            Get.toNamed(Routes.MOVIE_DETAILS, arguments: [
                              controller
                                  .movieDetailsSimilarModel.results?[index].id
                            ]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                height: 250,
                                'https://image.tmdb.org/t/p/w500${controller.movieDetailsSimilarModel.results?[index].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.movieDetailsSimilarModel.results?[index]
                                    .title ??
                                '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
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

class DetailsViewButtons extends StatelessWidget {
  const DetailsViewButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      child: Container(
        margin: const EdgeInsets.only(left: 11),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(.7),
        ),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.deepOrange,
                size: 30,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.deepOrange,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
