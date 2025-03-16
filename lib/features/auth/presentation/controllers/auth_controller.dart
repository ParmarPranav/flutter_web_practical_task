import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool obscurePassword = true.obs;
  RxBool isLogin = true.obs;

  void togglePasswordVisibility() {

      obscurePassword.value = !obscurePassword.value;

  }

  void validateAndLogin() {

      emailError.value = _validateEmail(emailController.text) ??'';
      passwordError.value = _validatePassword(passwordController.text) ?? '';


    if (emailError.value == '' && passwordError.value == '') {
      isLoggedIn(true);
      emailController.clear();
      passwordController.clear();
      Get.offNamedUntil(AppRoutes.main, (route) => false);
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  Future<void> isLoggedIn(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_login',isLogin);

  }
}