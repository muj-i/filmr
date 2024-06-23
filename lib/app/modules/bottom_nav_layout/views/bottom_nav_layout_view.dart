import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_layout_controller.dart';

class BottomNavLayoutView extends GetView<BottomNavLayoutController> {
  const BottomNavLayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.screens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 20, 18, 24),
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          unselectedItemColor: Colors.white.withOpacity(.30),
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(.30)),
          showUnselectedLabels: true,
          selectedItemColor: Colors.deepOrange,
          onTap: (int index) {
            controller.changeScreen(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              activeIcon: Icon(FontAwesomeIcons.house),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidCirclePlay),
              activeIcon: Icon(FontAwesomeIcons.solidCirclePlay),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userLarge),
              activeIcon: Icon(FontAwesomeIcons.userLarge),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
