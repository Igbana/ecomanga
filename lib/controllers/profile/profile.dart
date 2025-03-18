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
  late User user;

  void getUser() async {
    isLoading.value = true;

    try {
      // POST REQUEST
      final uid = Controllers.prefController.uId;
      print(uid);
      final response = await http.get(
        Uri.parse("${Urls.users}/$uid"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Controllers.prefController.aTk}',
        },
      );
      data = await json.decode(response.body);
      print(data);

      if (response.statusCode.toString()[0] == "2") {
        // auth successful
        user = User.fromJson(data);
        print(user.firstName);
      } else {
        // response error handling
        errorMessage.value = data['message'];
        throw Exception("Unauthorized");
      }
    } catch (e) {
      // caught error handling
      errorMessage.value = e.toString();
    }

    // turn off loading
    isLoading.value = false;
  }
}
