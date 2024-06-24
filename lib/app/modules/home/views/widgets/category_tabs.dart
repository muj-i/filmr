import 'package:filmr/app/modules/home/controllers/home_controller.dart';
import 'package:filmr/app/modules/home/views/widgets/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.updateTabIndex(0);
    return SizedBox(
      height: Get.height * .5.h,
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                controller.updateTabIndex(tabController.index);
                switch (tabController.index) {
                  case 0:
                    controller.getPopularMoviesList();
                    break;
                  case 1:
                    controller.getTopRatedMoviesList();
                    break;
                  case 2:
                    controller.getUpcomingMoviesList();
                    break;

                  default:
                    break;
                }
              }
            });
            return Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    splashBorderRadius: BorderRadius.circular(30),
                    tabs: [
                      _buildTab(0, 'Popular Movies', controller),
                      _buildTab(1, 'Top Rated', controller),
                      _buildTab(2, 'Upcoming', controller),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      // height: Get.height - kBottomNavigationBarHeight - 100,
                      child: TabBarView(
                          // physics: NeverScrollableScrollPhysics(),
                          children: [
                            MoviesList(),
                            MoviesList(),
                            MoviesList(),
                          ]),
                    ),
                  ),
                ],
              );
            });
          },
        ),
      ),
    );
  }

  Widget _buildTab(int index, String text, HomeController controller) {
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
