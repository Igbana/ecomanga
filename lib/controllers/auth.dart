import 'dart:convert';

import 'package:ecomanga/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool authSuccessful = false.obs;
  Map data = {};

  void register(
    String password,
    String firstName,
    String lastName,
    String username,
    String email,
    String phoneNo,
  ) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        (Urls.auth_register),
        body: jsonEncode(<String, String>{
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          "username": username,
          'email': email,
          'phoneNo': phoneNo,
          'role': 'user',
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      data = await json.decode(response.body);
      if (response.statusCode.toString()[0] == "2") {
        print(data);
        authSuccessful.value = true;
      } else {
        Get.snackbar(
          "Error",
          data['message'].join("\n"),
          backgroundColor: Colors.red,
        );
        print("Here");
      }
      print(data);
    } catch (e) {
      Get.snackbar("Error", "Unable to create account. Please try again");
    }
    isLoading.value = false;
  }
}
