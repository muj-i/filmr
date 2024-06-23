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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Find Movies, Tv series \nand more...',
                  style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
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
      ),
    );
  }
}
