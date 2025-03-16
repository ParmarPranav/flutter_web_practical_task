import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/features/users/presentation/controllers/users_controller.dart';
import 'package:flutter_web_practical_task/features/users/presentation/view/widgets/users_data_table_source.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/drawer/main_drawer.dart';
import '../../../../responsive_layout.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  static final UsersController controller = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Obx(
      () => Scaffold(
        backgroundColor: isLightTheme? Colors.white:Colors.transparent,
        drawer:
            ResponsiveLayout.isMobile(context) ||
                    ResponsiveLayout.isTablet(context)
                ? MainDrawer(
                  navigatorKey:
                      Navigator.of(context).widget.key
                          as GlobalKey<NavigatorState>,
                )
                : null,
        appBar:
            ResponsiveLayout.isMobile(context) ||
                    ResponsiveLayout.isTablet(context)
                ? controller.selectedUsersList.isNotEmpty
                    ? _selectionAppBarWidget(context)
                    : controller.isSearching.value
                    ? _searchWidget(context)
                    : _defaultAppBarWidget(context)
                : null,
        body: ResponsiveLayout(
          mobile: _buildMobileView(context),
          tablet: _buildTabletView(context),
          desktop: _buildDesktopView(context),
        ),
      ),
    );
  }

  AppBar _defaultAppBarWidget(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return AppBar(
      backgroundColor: isLightTheme ? Colors.white : Colors.grey.shade800,
      toolbarHeight: 50,
      elevation: 0,

      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        if (ResponsiveLayout.isDesktop(context))
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.decrease_indent,
                    color: isLightTheme ? Colors.black : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Filter',style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
                ],
              ),
            ),
          ),
        if (ResponsiveLayout.isDesktop(context))
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.sort_up,
                    color: isLightTheme ? Colors.black : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Sort',style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
                ],
              ),
            ),
          ),
        GestureDetector(
          onTap: () {
            controller.startSearch();
          },
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: isLightTheme ? Colors.black : Colors.white,
                ),
                SizedBox(width: 5),
                Text('Search',style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),),
              ],
            ),
          ),
        ),
        if (ResponsiveLayout.isDesktop(context))
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.ellipsis,
                    color: isLightTheme ? Colors.black : Colors.white,
                  ),
                ],
              ),
            ),
          ),
        if (ResponsiveLayout.isDesktop(context))
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.share,
                    color: isLightTheme ? Colors.black : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Export'),
                ],
              ),
            ),
          ),
        if (ResponsiveLayout.isDesktop(context)) SizedBox(width: 10),
        if (ResponsiveLayout.isDesktop(context))
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.add,
                    color: isLightTheme ? Colors.black : Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text('Add New'),
                ],
              ),
            ),
          ),
        SizedBox(width: 10),
      ],
    );
  }

  AppBar _selectionAppBarWidget(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return AppBar(
      backgroundColor: isLightTheme?Colors.white:Colors.grey.shade800,
      toolbarHeight: 70,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 3,
      title: Text(
        'Selected (${controller.selectedUsersList.length})',
        style: TextStyle(
          fontSize: 20,
          color: isLightTheme?Colors.black:Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar _searchWidget(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return AppBar(

      elevation: 0,
      toolbarHeight: 60,
      leading: InkWell(
        onTap: () {
          if (controller.searchQueryEditingController.text.isEmpty) {
            controller.isSearching.value = false;
            return;
          }
          controller.clearSearchQuery();
        },
        child: Icon(Icons.arrow_back_ios,color: isLightTheme?Colors.black:Colors.white,),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      title: TextField(
        controller: controller.searchQueryEditingController,
        autofocus: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Search Users...',
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        ),
        style:  TextStyle(color: isLightTheme?Colors.black:Colors.white, fontSize: 16.0),
        onChanged: controller.updateSearchQuery,
      ),
      backgroundColor: isLightTheme?Colors.white:Colors.grey.shade800,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: IconButton(
            icon: const Icon(Icons.clear, color: Colors.black, size: 20),
            onPressed: () {
              if (controller.searchQueryEditingController.text.isEmpty) {
                controller.isSearching.value = false;
                return;
              }
              controller.clearSearchQuery();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),

          child: Scaffold(
            appBar:
                controller.selectedUsersList.value.isNotEmpty
                    ? _selectionAppBarWidget(context)
                    : controller.isSearching.value
                    ? _searchWidget(context)
                    : _defaultAppBarWidget(context),
            body:
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : controller.isSearching.value
                    ? _buildSearchUserListDataTable(context)
                    : _buildUserListDataTable(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTabletView(BuildContext context) {
    return controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : controller.isSearching.value
        ? _buildSearchUserListDataTable(context)
        : _buildUserListDataTable(context);
  }

  Widget _buildMobileView(BuildContext context) {
    return controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : controller.isSearching.value
        ? _buildSearchUserListDataTable(context)
        : _buildUserListDataTable(context);
  }

  Widget _buildUserListDataTable(BuildContext context) {
    return Obx(
      () => Scrollbar(
        controller: controller.verticalScrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: controller.verticalScrollController,
          child: Scrollbar(
            controller: controller.horizontalScrollController,
            thumbVisibility: true,
            trackVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: controller.horizontalScrollController,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  sortAscending: controller.sortAsc.value,
                  sortColumnIndex: controller.sortColumnIndex?.value,
                  onSelectAll: controller.onSelectAllUsers,
                  showFirstLastButtons: true,
                  onRowsPerPageChanged: (value) {
                    controller.LIMIT_PER_PAGE.value = value.toString();
                  },
                  rowsPerPage:
                      num.parse(controller.LIMIT_PER_PAGE.value).toInt(),
                  onPageChanged: (value) {
                    controller.verticalScrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Mobile No.')),
                    DataColumn(label: Text('Address')),
                    DataColumn(label: Text('Actions')),
                  ],
                  source: UserDataTableSource(
                    userList: controller.usersList.value,
                    selectedUserList: controller.selectedUsersList.value,
                    onSelectRestaurantChanged: controller.onSelectUserChanged,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchUserListDataTable(BuildContext context) {
    return Obx(
      () => Scrollbar(
        controller: controller.searchVerticalScrollController,
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        child: SingleChildScrollView(
          controller: controller.searchVerticalScrollController,
          child: Scrollbar(
            controller: controller.searchHorizontalScrollController,
            thumbVisibility: true,
            trackVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: controller.searchHorizontalScrollController,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  sortAscending: controller.sortAsc.value,
                  sortColumnIndex: controller.sortColumnIndex?.value,
                  onSelectAll: controller.onSelectAllUsers,
                  showFirstLastButtons: true,
                  onRowsPerPageChanged: (value) {
                    controller.LIMIT_PER_PAGE.value = value.toString();
                  },
                  rowsPerPage:
                      num.parse(controller.LIMIT_PER_PAGE.value).toInt(),
                  onPageChanged: (value) {
                    controller.searchVerticalScrollController.animateTo(
                      0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Mobile No.')),
                    DataColumn(label: Text('Address')),
                    DataColumn(label: Text('Actions')),
                  ],
                  source: UserDataTableSource(
                    userList: controller.searchUsersList.value,
                    selectedUserList: controller.selectedUsersList.value,
                    onSelectRestaurantChanged: controller.onSelectUserChanged,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
