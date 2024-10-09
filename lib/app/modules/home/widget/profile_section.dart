import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ProfileSection extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              homeController.userName.value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            Obx(() => Text(homeController.phoneNumber.value)),
          ],
        ),
      ],
    );
  }
}
