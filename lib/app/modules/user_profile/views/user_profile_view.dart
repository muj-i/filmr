import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'No UI design provided yet.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
