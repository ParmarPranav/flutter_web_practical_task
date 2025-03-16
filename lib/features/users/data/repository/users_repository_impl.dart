import 'package:dio/dio.dart';
import 'package:flutter_web_practical_task/core/resources/data_state.dart';
import 'package:flutter_web_practical_task/features/users/data/models/users_model.dart';

import '../../domain/repository/users_repository.dart';
import '../data_sources/remote/users_remote_api_service.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersRemoteApiService _apiService;

  UsersRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<UsersModel>>> getUsersList() async {
    try {
      final usersList = await _apiService.getUsersList();
      return DataSuccess(usersList);
    }
    on DioException catch (err) {
      return DataDioException(err);
    }
  }
}
