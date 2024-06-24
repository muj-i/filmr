import 'package:filmr/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              itemCount: controller.movieDetailsList[controller.index.value].genres?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.movieDetailsList[controller.index.value].genres?[index].name ?? '',
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
                controller.movieDetailsList[controller.index.value].title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'Rating: ${controller.movieDetailsList[controller.index.value].voteAverage?.toStringAsPrecision(2).toString() ?? ''}',
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
          controller.movieDetailsList[controller.index.value].overview ?? '',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

