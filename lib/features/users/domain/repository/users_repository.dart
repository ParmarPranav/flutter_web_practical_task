import 'package:flutter_web_practical_task/core/resources/data_state.dart';
import 'package:flutter_web_practical_task/features/users/data/models/users_model.dart';

abstract class UsersRepository {
  Future<DataState<List<UsersModel>>> getUsersList();
}