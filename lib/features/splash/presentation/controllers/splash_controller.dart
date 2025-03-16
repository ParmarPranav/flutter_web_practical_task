import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';

class SplashController extends GetxController {

  RxBool isLogin = false.obs;
  

  Future<void> navigation() async {
    final prefs = await SharedPreferences.getInstance();
    isLogin.value = prefs.getBool('is_login') ?? false;

    if(isLogin.value == true){
      Get.offNamedUntil(AppRoutes.main, (route) => false,);
    }else{
      Get.offNamedUntil(AppRoutes.login, (route) => false,);
    }
  }
}