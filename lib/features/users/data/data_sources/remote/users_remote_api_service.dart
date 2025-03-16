import 'package:dio/dio.dart';
import 'package:flutter_web_practical_task/config/routes/api_endpoints.dart';
import 'package:flutter_web_practical_task/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/users_model.dart';

part 'users_remote_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UsersRemoteApiService {
  factory UsersRemoteApiService(Dio dio) = _UsersRemoteApiService;

  @GET(APIEndpoints.users)
  Future<List<UsersModel>> getUsersList();
}
