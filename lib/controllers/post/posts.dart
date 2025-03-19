import 'dart:convert';

import 'package:ecomanga/controllers/controllers.dart';
import 'package:ecomanga/models/models.dart';
import 'package:ecomanga/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PostController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  Map<String, dynamic> data = {};
  late List<Post> posts;

  void getPosts() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Urls.post,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Controllers.prefController.aTk}',
        },
      );
      data = await json.decode(response.body);

      if (response.statusCode == 200) {
        print(data['data']);
        List<Post> posts = [];
        data['data'].forEach((post) => posts.add(Post.fromJson(post)));
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