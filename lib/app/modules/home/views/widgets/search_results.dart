import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/home/controllers/home_controller.dart';
import 'package:filmr/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.isSearchListLoading.value
            ? const CircularLoader()
            : Expanded(
                child: ListView.builder(
                  itemCount: controller.searchList.results?.length,
                  itemBuilder: (context, index) {
                    final movieName =
                        controller.searchList.results?[index].title ?? '';
                    return Container(
                      height: 250,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 33, 28, 49),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Get.toNamed(Routes.MOVIE_DETAILS, arguments: [
                                  controller.searchList.results?[index].id
                                ]);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  controller.searchList.results?[index]
                                              .posterPath ==
                                          null
                                      ? 'https://via.placeholder.com/150'
                                      : 'https://image.tmdb.org/t/p/w500${controller.searchList.results?[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movieName,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    controller.searchList.results![index]
                                                .popularity !=
                                            null
                                        ? 'Popularity: ${controller.searchList.results![index].popularity!.toStringAsFixed(2).toString()}'
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.searchList.results![index]
                                                .voteAverage !=
                                            null
                                        ? 'Average: ${controller.searchList.results![index].voteAverage!.toStringAsFixed(2).toString()}'
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.searchList.results![index]
                                                .voteCount !=
                                            null
                                        ? 'Vote: ${controller.searchList.results![index].voteCount!.toStringAsFixed(2).toString()}'
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Overview: ${controller.searchList.results![index].overview}',
                                    maxLines: 4,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
