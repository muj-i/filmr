import 'package:filmr/app/modules/now_playing/views/widgets/now_playing_movies.dart';
import 'package:filmr/app/modules/now_playing/views/widgets/now_playing_tv_series.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/now_playing_controller.dart';

class NowPlayingView extends GetView<NowPlayingController> {
  const NowPlayingView({super.key});
  @override
  Widget build(BuildContext context) {
    final NowPlayingController controller = Get.put(NowPlayingController());
    controller.getNowPlayingMoviesList();
    controller.updateTabIndex(0);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                controller.updateTabIndex(tabController.index);
              }
            });
            return Scaffold(
              body: Obx(() {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      onTap: (value) {
                        if (value == 0) {
                          controller.getNowPlayingMoviesList();
                        } else {
                          controller.getNowPlayingTvSeriesList();
                        }
                      },
                      // padding: EdgeInsets.zero,
                      // tabAlignment: TabAlignment.start,
                      // labelPadding:
                      //     const EdgeInsets.symmetric(horizontal: 10),
                      // isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      // splashBorderRadius: BorderRadius.circular(30),
                      tabs: [
                        _buildTab(0, 'Movies', controller),
                        _buildTab(1, 'Tv Series', controller),
                      ],
                    ),
                    Flexible(
                      child: SizedBox(
                        height: Get.height - kBottomNavigationBarHeight,
                        child: const TabBarView(children: [
                          NowPlayingMovies(),
                          NowPlayingTvSeries(),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTab(int index, String text, NowPlayingController controller) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(18),
          border: Border(
            bottom: BorderSide(
              color: controller.tabIndex.value == index
                  ? Colors.deepOrange
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: controller.tabIndex.value == index
                ? Colors.deepOrange
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
