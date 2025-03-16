import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/bindings.dart';
import 'package:flutter_web_practical_task/config/routes/app_routes.dart';
import 'package:flutter_web_practical_task/config/routes/main_router.dart';
import 'package:flutter_web_practical_task/config/theme/app_themes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      defaultTransition: Transition.fade,
      initialRoute: AppRoutes.splash,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      getPages: MainRouter.routes,
    );
  }
}


