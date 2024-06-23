import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO fix search results
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
                    final tvSeriesName =
                        controller.searchList.results?[index].name ?? '';
                    return Container(
                      height: 220,
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                controller.searchList.results?[index]
                                            .mediaType ==
                                        'tv'
                                    ? 'https://image.tmdb.org/t/p/w500${controller.tvSeriesList.results?[index].posterPath}'
                                    : 'https://image.tmdb.org/t/p/w500${controller.moviesList.results?[index].posterPath}',
                                fit: BoxFit.cover,
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
                                    controller.searchList.results?[index]
                                                .mediaType ==
                                            'tv'
                                        ? tvSeriesName
                                        : movieName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    controller.searchList.results?[index]
                                                .mediaType ==
                                            'tv'
                                        ? 'Category: TV Series'
                                        : 'Category: Movie',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                                        ? 'Average Vote: ${controller.searchList.results![index].voteAverage!.toStringAsFixed(2).toString()}'
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.searchList.results![index]
                                                .voteCount !=
                                            null
                                        ? 'Vote Count: ${controller.searchList.results![index].voteCount!.toStringAsFixed(2).toString()}'
                                        : '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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