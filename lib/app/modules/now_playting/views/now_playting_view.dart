import 'package:filmr/app/modules/now_playting/views/widgets/now_playing_movies.dart';
import 'package:filmr/app/modules/now_playting/views/widgets/now_playing_tv_series.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/now_playting_controller.dart';

class NowPlaytingView extends GetView<NowPlaytingController> {
  const NowPlaytingView({super.key});
  @override
  Widget build(BuildContext context) {
    final NowPlaytingController controller = Get.put(NowPlaytingController());
    controller.updateTabIndex(0);
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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

  Widget _buildTab(int index, String text, NowPlaytingController controller) {
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
