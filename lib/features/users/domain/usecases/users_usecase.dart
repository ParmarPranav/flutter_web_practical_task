import 'package:flutter_web_practical_task/features/users/domain/repository/users_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/users_model.dart';

class UsersUseCase {
  final UsersRepository _dashboardRepository;

  UsersUseCase(this._dashboardRepository);

  Future<DataState<List<UsersModel>>> getUsersList() {
    return _dashboardRepository.getUsersList();
  }
}