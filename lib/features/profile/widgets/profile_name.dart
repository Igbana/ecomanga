import 'package:ecomanga/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Controllers.profileController.isLoading.value) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
        );
      } else {
        return Text(
          "${Controllers.profileController.profile.firstName} ${Controllers.profileController.profile.lastName}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    });
  }
}
