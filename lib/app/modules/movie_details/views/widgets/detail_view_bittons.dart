import 'package:filmr/app/data/utils/favorite_movie_keeper.dart';
import 'package:filmr/app/modules/bottom_nav_layout/controllers/bottom_nav_layout_controller.dart';
import 'package:filmr/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsViewButtons extends StatelessWidget {
  const DetailsViewButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MovieDetailsController controller = Get.put(MovieDetailsController());
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 11),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(.7),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color.fromARGB(255, 33, 28, 49),
                size: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 11),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(.7),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                FavouriteMoviesKeeper.saveMovieDetails(controller.movieDetails);
                Get.back();
                Future.delayed(const Duration(milliseconds: 500),
                    () => BottomNavLayoutController.to.changeScreen(2));
              },
              child: const Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 33, 28, 49),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
