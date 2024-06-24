import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:filmr/app/modules/bottom_nav_layout/views/bottom_nav_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // disableNavigation: true,
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),

      duration: 1000,
      nextScreen: const BottomNavLayoutView(),
      splash: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/android_logo.png'),
                          fit: BoxFit.contain)),
                ),
              ),
              Expanded(
                child: Container(
                  child: const Text(
                    'By Mujahedul Islam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // splash: Image.asset('assets/images/background.jpg'),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
      // centered: false,
    );
  }
}
