import 'package:filmr/app/common/widgets/circular_loader.dart';
import 'package:filmr/app/data/models/movie_details_model.dart';
import 'package:filmr/app/data/utils/favorite_movie_keeper.dart';
import 'package:filmr/app/modules/movie_details/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UserProfileController());
    return SafeArea(
      child: Obx(() {
        return controller.isClearing.value
            ? const CircularLoader()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Favorite Movies',
                            style: TextStyle(fontSize: 24)),
                        IconButton(
                          onPressed: () {
                            controller.clearHiveData();
                          },
                          icon: const Icon(FontAwesomeIcons.solidCircleXmark),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<MovieDetailsModel>>(
                      future: FavouriteMoviesKeeper.getMovieDetailsDatabase(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('Nothing to show!'));
                        } else {
                          final movieDetailsDataList = snapshot.data;

                          return ListView.builder(
                            itemCount: movieDetailsDataList?.length,
                            itemBuilder: (context, index) {
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
                                        if (movieDetailsDataList?[index].id !=
                                            null) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailsView(
                                                id: movieDetailsDataList?[index]
                                                    .id,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          movieDetailsDataList?[index]
                                                      .posterPath ==
                                                  null
                                              ? 'https://via.placeholder.com/150'
                                              : 'https://image.tmdb.org/t/p/w500${movieDetailsDataList?[index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      movieDetailsDataList?[index].title ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
