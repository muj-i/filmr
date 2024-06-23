import 'package:filmr/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCredits extends StatelessWidget {
  const MovieCredits({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieDetailsController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Casts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.movieDetailsCreditsModel.cast?.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height:   20,
                    // margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              height: 200,
                              controller.movieDetailsCreditsModel.cast?[index]
                                          .profilePath ==
                                      null
                                  ? 'https://via.placeholder.com/150'
                                  : 'https://image.tmdb.org/t/p/w500${controller.movieDetailsCreditsModel.cast?[index].profilePath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.movieDetailsCreditsModel.cast?[index]
                                    .name ??
                                '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          const Text('Credits:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.movieDetailsCreditsModel.crew?.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height:   20,
                    // margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              height: 200,
                              controller.movieDetailsCreditsModel.crew?[index]
                                          .profilePath ==
                                      null
                                  ? 'https://via.placeholder.com/150'
                                  : 'https://image.tmdb.org/t/p/w500${controller.movieDetailsCreditsModel.crew?[index].profilePath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.movieDetailsCreditsModel.crew?[index]
                                    .name ??
                                '',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
