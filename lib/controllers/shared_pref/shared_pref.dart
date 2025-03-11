import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController extends GetxController {
  SharedPreferences? _pref;
  RxBool isloading = false.obs;

  void initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  void login(String aTk, String rTk) {
    if (!_pref!.containsKey('aTk') && !_pref!.containsKey('rTk')) {
      _pref?.setString('aTk', aTk);
      _pref?.setString('rTk', rTk);
    }
  }

  void logout(String aTk, String rTk) {
    if (!_pref!.containsKey('aTk') || !_pref!.containsKey('rTk')) {
      _pref?.remove('aTk');
      _pref?.remove('rTk');
    }
  }

  bool isLoggedin(String aTk, String rTk) =>
      _pref!.containsKey(aTk) && _pref!.containsKey(aTk);

  Map gTk() => {
        "accessToken": _pref?.getString('aTk') ?? "",
        "refreshToken": _pref?.getString('rTk') ?? "",
      };
}
