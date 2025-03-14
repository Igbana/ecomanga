import 'package:ecomanga/controllers/auth/auth.dart';
import 'package:ecomanga/controllers/shared_pref/shared_pref.dart';
import 'package:get/get.dart';

export 'shared_pref/shared_pref.dart';
export 'auth/auth.dart';

Future<void> initControllers() async {
  Get.put(PrefController()).initPref();

  Get.put(RegisterController());
  Get.put(LoginController());
  Get.put(GoogleController());
  Get.put(FacebookController());
}
