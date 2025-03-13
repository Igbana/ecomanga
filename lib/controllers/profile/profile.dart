import 'dart:convert';

import 'package:ecomanga/models/models.dart';
import 'package:ecomanga/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  Map<String, dynamic> data = {};

  Future<User> getProfile(
      {required String password, required String email}) async {
    isLoading.value = true;

    try {
      // POST REQUEST
      final response = await http.get(Urls.auth_login);
      data = await json.decode(response.body);

      if (response.statusCode.toString()[0] == "2") {
        // auth successful
      } else {
        // response error handling
        errorMessage.value = data['message'];
      }
    } catch (e) {
      // caught error handling
      errorMessage.value = e.toString();
    }

    // turn off loading
    isLoading.value = false;
    return User.fromJson(data);
  }
}
