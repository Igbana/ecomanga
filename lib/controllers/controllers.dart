import 'package:ecomanga/controllers/auth/auth.dart';
import 'package:get/get.dart';

Future<void> initControllers() async {
  Get.put(RegisterController());
  Get.put(LoginController());
}
