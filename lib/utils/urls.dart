import 'package:ecomanga/controllers/controllers.dart';
import 'package:ecomanga/utils/utils.dart';
import 'package:get/get.dart';

class Urls {
  static final Uri app = Uri.parse(Constants.BASE_URL);
  static final Uri app_status = Uri.parse("${Constants.BASE_URL}/status/");
  static final Uri activity = Uri.parse("${Constants.BASE_URL}/activity/");
  static final Uri auth_google =
      Uri.parse("${Constants.BASE_URL}/auth/google/");
  static final Uri auth_facebook =
      Uri.parse("${Constants.BASE_URL}/auth/facebook/");

  static final Uri auth_login = Uri.parse("${Constants.BASE_URL}/auth/login");

  static final Uri auth_logout =
      Uri.parse("${Constants.BASE_URL}/auth/logout/");
  static final Uri auth_register =
      Uri.parse("${Constants.BASE_URL}/auth/register/");
  static final Uri auth_refresh =
      Uri.parse("${Constants.BASE_URL}/auth/refresh/");
  static final Uri auth_verify =
      Uri.parse("${Constants.BASE_URL}/auth/verify-email/");
  static final Uri auth_passwordForgot =
      Uri.parse("${Constants.BASE_URL}/auth/password/forgot/");
  static final Uri auth_passwordReset =
      Uri.parse("${Constants.BASE_URL}/auth/password/reset/");

  static final String users = "${Constants.BASE_URL}/users/";
}
