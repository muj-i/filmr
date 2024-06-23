import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/now_playing/controllers/now_playing_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NowPlayingController());
    return Obx(() {
      return controller.isShowsListLoading.value
          ? const CircularLoader()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisExtent: 330,
              ),
              itemCount: controller.moviesNowPlayingList.results?.length,
              itemBuilder: (context, index) {
                return Container(
                  // height:   20,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          height: 250,
                          'https://image.tmdb.org/t/p/w500${controller.moviesNowPlayingList.results?[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.moviesNowPlayingList.results?[index].title ??
                            '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            );
    });
  }
}
