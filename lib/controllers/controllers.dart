import 'package:ecomanga/controllers/auth/auth.dart';
import 'package:ecomanga/controllers/profile/profile.dart';
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

  Get.put(ProfileController());
}

class Controllers {
  static PrefController prefController = Get.find();
  static LoginController loginController = Get.find();
  static ProfileController profileController = Get.find();
}
