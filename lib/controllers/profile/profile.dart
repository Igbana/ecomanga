import 'dart:convert';

import 'package:ecomanga/controllers/controllers.dart';
import 'package:ecomanga/models/models.dart';
import 'package:ecomanga/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  Map<String, dynamic> data = {};
  User? user, profile;

  Future<bool> getUser() async {
    isLoading.value = true;
    user = null;
    try {
      print(Controllers.loginController.isLoading.value);
      Controllers.prefController.initPref().then((_) async {
        final uid = Controllers.prefController.uId;
        final response = await http.get(
          Uri.parse("${Urls.users}$uid"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Controllers.prefController.aTk}',
          },
        );
        data = await json.decode(response.body);
        print("Profile data: $data");
        print("Profileinfo: $uid");
        if (response.statusCode == 200) {
          user = User.fromJson(data);
          isLoading.value = false;
        } else {
          errorMessage.value = data['message'];
          isLoading.value = false;
          throw Exception("Unauthorized");
        }
      });
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      isLoading.value = false;
      throw Exception("Error");
    }

  }

  void getProfile() async {
    isLoading.value = true;

    try {
      final uid = Controllers.prefController.uId;
      print(uid);
      final response = await http.get(
        Urls.profile,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Controllers.prefController.aTk}',
        },
      );
      data = await json.decode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(data['data']);
        profile = User.fromJson(data['data']);
      } else {
        errorMessage.value = data['message'];
        // throw Exception("Unauthorized");
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }

    isLoading.value = false;
  }
}
