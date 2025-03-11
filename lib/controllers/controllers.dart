import 'package:ecomanga/controllers/auth/auth.dart';
import 'package:ecomanga/controllers/shared_pref/shared_pref.dart';
import 'package:get/get.dart';

Future<void> initControllers() async {
  Get.put(PrefController()).initPref();
  Get.put(RegisterController());
  Get.put(LoginController());
}
