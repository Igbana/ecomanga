import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController extends GetxController {
  SharedPreferences? _pref;
  RxBool isloading = false.obs;

  void initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  void login(String aTk, String rTk, String uId) {
    if (!_pref!.containsKey('aTk') && !_pref!.containsKey('rTk')) {
      _pref?.setString('aTk', aTk);
      _pref?.setString('rTk', rTk);
      _pref?.setString('uid', uId);
    } else {
      logout();
      login(aTk, rTk, uId);
    }
  }

  void logout() {
    if (_pref!.containsKey('aTk') || _pref!.containsKey('rTk')) {
      _pref?.remove('aTk');
      _pref?.remove('rTk');
      _pref?.remove('uId');
    }
  }

  bool isLoggedin(String aTk, String rTk) =>
      _pref!.containsKey(aTk) && _pref!.containsKey(aTk);

  Map gTk() => {
        "aTk": _pref?.getString('aTk') ?? "",
        "rTk": _pref?.getString('rTk') ?? "",
        "uId": _pref?.getString('uId') ?? "",
      };
}
