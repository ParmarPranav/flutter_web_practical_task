import 'package:flutter_web_practical_task/features/main/presentation/view/main_screen.dart';
import 'package:flutter_web_practical_task/features/splash/presentation/view/splash_screen.dart';

import 'package:get/get.dart';

import '../../bindings.dart';
import '../../features/auth/presentation/view/login_screen.dart';

class MainRouter {
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen(), binding: AppBindings()),
    GetPage(name: '/login', page: () => LoginScreen(), binding: AppBindings()),
    GetPage(name: '/main', page: () => MainScreen(), binding: AppBindings()),
  ];
}
