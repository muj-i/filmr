import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/home/controllers/home_controller.dart';
import 'package:filmr/app/modules/movie_details/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.getPopularMoviesList();
    return Obx(() {
      return controller.isShowsListLoading.value
          ? const CircularLoader()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisExtent: 360,
              ),
              itemCount: controller.moviesList.results!.length + 1,
              itemBuilder: (context, index) {
                if (controller.moviesList.results!.length == index) {
                  return const SizedBox(
                    height: 100,
                  );
                }
                return Container(
                  margin: const EdgeInsets.all(8),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsView(
                                id: controller.moviesList.results![index].id,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            controller.moviesList.results?[index].posterPath ==
                                    null
                                ? 'https://via.placeholder.com/150'
                                : 'https://image.tmdb.org/t/p/w500${controller.moviesList.results?[index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.moviesList.results?[index].title ?? '',
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
