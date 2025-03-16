import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/core/resources/data_state.dart';
import 'package:flutter_web_practical_task/features/users/data/models/users_model.dart';
import 'package:flutter_web_practical_task/features/users/domain/usecases/users_usecase.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final UsersUseCase _dashboardUseCase;

  UsersController(this._dashboardUseCase);

  ScrollController verticalScrollController = ScrollController();
  ScrollController searchVerticalScrollController = ScrollController();

  ScrollController horizontalScrollController = ScrollController();
  ScrollController searchHorizontalScrollController = ScrollController();

  RxList<UsersModel> usersList = RxList([]);
  RxList<UsersModel> selectedUsersList = RxList([]);
  RxBool isLoading = RxBool(false);

  RxBool sortAsc = true.obs;
  RxInt? sortColumnIndex;
  RxString LIMIT_PER_PAGE = '10'.obs;

  RxBool isSearching = false.obs;
  final TextEditingController searchQueryEditingController =
      TextEditingController();
  RxList<UsersModel> searchUsersList = RxList([]);

  Future<void> getUsersList() async {
    try {
      isLoading.value = true;
      final dataState = await _dashboardUseCase.getUsersList();
      if (dataState is DataSuccess) {
        usersList.value = dataState.data ?? [];
        Get.showSnackbar(
          GetSnackBar(
            title: 'Success',
            message: 'Users List Fetched Successfully',
            icon: Icon(Icons.done, color: Colors.white),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1, milliseconds: 500),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Error',
            message: 'Failed to fetched users list !!',
            icon: Icon(Icons.error, color: Colors.white),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1, milliseconds: 500),
          ),
        );
      }
    } catch (err) {
      print(err);
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: 'Something went wrong !!',
          icon: Icon(Icons.error, color: Colors.white),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1, milliseconds: 500),
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void search() {
    searchUsersList.value =
        usersList
            .where(
              (item) => item.name.toLowerCase().contains(
                searchQueryEditingController.text.toLowerCase(),
              ),
            )
            .toList();
  }

  void startSearch() {
    print("open search box");
    search();
    isSearching.value = true;
  }

  void updateSearchQuery(String newQuery) {
    print("search query " + newQuery);
    search();
  }

  void clearSearchQuery() {
    print("close search box");
    searchQueryEditingController.clear();
    selectedUsersList.clear();
    isSearching.value = false;
  }

  void onSelectUserChanged(bool? value, UsersModel userModel) {
    if (value ?? true) {
      selectedUsersList.add(userModel);
    } else {
      selectedUsersList.removeWhere((restau) => restau.id == userModel.id);
    }
    update();
  }

  void onSelectAllUsers(bool? value) {
    if (value ?? true) {
      selectedUsersList.clear();
      selectedUsersList.addAll(usersList);
    } else {
      selectedUsersList.clear();
    }
  }
}
