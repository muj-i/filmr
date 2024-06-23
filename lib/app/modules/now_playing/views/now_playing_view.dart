import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/now_playing_controller.dart';

class NowPlayingView extends GetView<NowPlayingController> {
  const NowPlayingView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NowPlayingController());
    controller.getNowPlayingMoviesList();
    return RefreshIndicator(
      color: Colors.deepOrange,
      onRefresh: () async {
        await controller.getNowPlayingMoviesList();
      },
      child: Obx(() {
        return controller.isShowsListLoading.value
            ? const CircularLoader()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisExtent: 355,
                ),
                itemCount: controller.moviesNowPlayingList.results?.length,
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
                              controller.moviesNowPlayingList.results?[index].id
                            ]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                height: 250,
                                'https://image.tmdb.org/t/p/w500${controller.moviesNowPlayingList.results?[index].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.moviesNowPlayingList.results?[index]
                                    .title ??
                                '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}
