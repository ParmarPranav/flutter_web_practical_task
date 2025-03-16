import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/users_model.dart';

class UserDataTableSource extends DataTableSource {
  final List<UsersModel> userList;
  final List<UsersModel> selectedUserList;
  final void Function(bool?, UsersModel) onSelectRestaurantChanged;

  UserDataTableSource({
    required this.userList,
    required this.selectedUserList,
    required this.onSelectRestaurantChanged,
  });

  @override
  DataRow getRow(int index) {
    final user = userList[index];
    return DataRow(
      selected: selectedUserList.any(
        (selectedRestaurant) => selectedRestaurant.id == user.id,
      ),
      onSelectChanged: (value) => onSelectRestaurantChanged(value, user),
      cells: [
        DataCell(Text(user.id.toString(), style: TextStyle(fontSize: 15))),
        DataCell(Text(user.name, style: TextStyle(fontSize: 15))),
        DataCell(Text(user.email, style: TextStyle(fontSize: 15))),
        DataCell(Text(user.phone, style: TextStyle(fontSize: 15))),
        DataCell(
          Text(
            '${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode}',
            style: TextStyle(fontSize: 15),
          ),
        ),
        DataCell(
          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(CupertinoIcons.delete, color: Colors.red),
                label: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => userList.length;

  @override
  int get selectedRowCount => selectedUserList.length;
}
