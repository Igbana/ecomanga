import 'package:ecomanga/controllers/auth.dart';
import 'package:get/get.dart';

Future<void> initControllers() async {
  final c = Get.put(AuthController());
}
