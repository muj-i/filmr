import 'package:filmr/app/modules/home/views/widgets/category_tabs.dart';
import 'package:filmr/app/modules/home/views/widgets/search_results.dart';
import 'package:filmr/app/modules/home/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    controller.updateTabIndex(0);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        title: const Text('Find Popular, Top rated \nMovies and more...',
            style: TextStyle(fontSize: 24)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Search bar
            const SearchTextField(),
            const SizedBox(height: 20),
            GetBuilder<HomeController>(builder: (homeController) {
              return homeController.searchController.value.text.isEmpty
                  ? const CategoryTabs()
                  : const SearchResults();
            }),
          ],
        ),
      ),
    );
  }
}
