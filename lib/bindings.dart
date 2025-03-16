import 'package:dio/dio.dart';
import 'package:flutter_web_practical_task/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_web_practical_task/features/setting/presentation/controllers/setting_controller.dart';
import 'package:flutter_web_practical_task/features/users/data/data_sources/remote/users_remote_api_service.dart';
import 'package:flutter_web_practical_task/features/users/data/repository/users_repository_impl.dart';
import 'package:flutter_web_practical_task/features/users/domain/repository/users_repository.dart';
import 'package:flutter_web_practical_task/features/users/domain/usecases/users_usecase.dart';
import 'package:flutter_web_practical_task/features/users/presentation/controllers/users_controller.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/controllers/splash_controller.dart';

class AppBindings extends Bindings {

  @override
  void dependencies() {
    // Dio instance
    Get.lazyPut<Dio>(() => Dio());

    // Remote API Services
    Get.lazyPut<UsersRemoteApiService>(() => UsersRemoteApiService(Get.find<Dio>()));

    // Repositories
    Get.lazyPut<UsersRepository>(() => UsersRepositoryImpl(Get.find<UsersRemoteApiService>()));

    // Use Cases
    Get.lazyPut<UsersUseCase>(() => UsersUseCase(Get.find<UsersRepository>()));

    // Controllers
    Get.lazyPut<UsersController>(() => UsersController(Get.find<UsersUseCase>()));
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
