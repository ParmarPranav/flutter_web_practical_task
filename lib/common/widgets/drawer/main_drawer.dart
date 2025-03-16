import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/config/routes/app_routes.dart';
import 'package:flutter_web_practical_task/features/users/presentation/controllers/users_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../responsive_layout.dart';
import 'drawer_list_tile.dart';

class MainDrawer extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const MainDrawer({super.key, required this.navigatorKey});

  @override
  MainDrawerState createState() => MainDrawerState();
}

class MainDrawerState extends State<MainDrawer> {
  int selectedIndex = -1; // -1 means no tile is selected

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          color: isLightTheme ?Colors.grey.shade50 :Colors.blueGrey[900],
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 7,
                          ),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.search),
                              SizedBox(width: 5),
                          SizedBox(width: ResponsiveLayout.isMobile(context) ||
                              ResponsiveLayout.isTablet(context) ? MediaQuery.of(context).size.width * 0.2:MediaQuery.of(context).size.width * 0.1,
                            height: ResponsiveLayout.isMobile(context) ||
                                ResponsiveLayout.isTablet(context) ? MediaQuery.of(context).size.width * 0.03 :MediaQuery.of(context).size.width * 0.01,
                            child: TextField(
                              autofocus: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
                              ),
                              style:  TextStyle(color: isLightTheme?Colors.black:Colors.white, fontSize: 16.0),
                            ),
                          ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.rectangle_3_offgrid,
                                title: "Dashboard",
                                onTap: setSelectedIndex,
                                index: 0,
                                selectedIndex: selectedIndex,
                                itemHandler: () {
                                  if (ResponsiveLayout.isMobile(context) ||
                                      ResponsiveLayout.isTablet(context)) {
                                    Navigator.of(context).pop();
                                  }
                                  Navigator.of(
                                    widget.navigatorKey!.currentContext
                                        as BuildContext,
                                  ).pushNamedAndRemoveUntil(
                                    AppRoutes.dashboard,
                                    (route) => false,
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.profile_circled,
                                title: "Users",
                                onTap: setSelectedIndex,
                                index: 1,
                                selectedIndex: selectedIndex,
                                itemHandler: () {
                                  if (ResponsiveLayout.isMobile(context) ||
                                      ResponsiveLayout.isTablet(context)) {
                                    Navigator.of(context).pop();
                                  }
                                  Navigator.of(
                                    widget.navigatorKey!.currentContext
                                        as BuildContext,
                                  ).pushNamedAndRemoveUntil(
                                    AppRoutes.users,
                                    (route) => false,
                                  );
                                  Get.find<UsersController>().getUsersList();
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.settings,
                                title: "Settings",
                                onTap: setSelectedIndex,
                                index: 2,
                                selectedIndex: selectedIndex,
                                itemHandler: () {
                                  if (ResponsiveLayout.isMobile(context) ||
                                      ResponsiveLayout.isTablet(context)) {
                                    Navigator.of(context).pop();
                                  }
                                  Navigator.of(
                                    widget.navigatorKey!.currentContext
                                        as BuildContext,
                                  ).pushNamedAndRemoveUntil(
                                    AppRoutes.settings,
                                    (route) => false,
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData:
                                    CupertinoIcons
                                        .plus_rectangle_on_rectangle,
                                title: "Projects",
                                onTap: setSelectedIndex,
                                index: 3,
                                selectedIndex: selectedIndex,
                                itemHandler: () {},
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.cube,
                                title: "Companies",
                                onTap: setSelectedIndex,
                                index: 4,
                                selectedIndex: selectedIndex,
                                itemHandler: () {},
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData:
                                    CupertinoIcons
                                        .rectangle_stack_person_crop,
                                title: "Reports",
                                onTap: setSelectedIndex,
                                index: 5,
                                selectedIndex: selectedIndex,
                                itemHandler: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.24,
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.app_badge,
                                title: "Notification",
                                onTap: setSelectedIndex,
                                index: 6,
                                selectedIndex: selectedIndex,
                                itemHandler: () {},
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData:
                                    CupertinoIcons.arrow_left_right_circle,
                                title: "Help Center",
                                onTap: setSelectedIndex,
                                index: 7,
                                selectedIndex: selectedIndex,
                                itemHandler: () {},
                              ),
                              divider(thickness: 2),
                            ],
                          ),
                          Column(
                            children: [
                              DrawerListTile(
                                iconData: CupertinoIcons.arrow_right_square,
                                title: "Log Out",
                                onTap: setSelectedIndex,
                                index: 8,
                                selectedIndex: selectedIndex,
                                itemHandler: ()  {
                                  isLoggedIn(false);
                                  Navigator.of(
                                    context,
                                  ).pushNamedAndRemoveUntil(
                                    AppRoutes.login,
                                    (route) => false,
                                  );
                                },
                              ),
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: isLightTheme?Colors.white.withOpacity(0.95):Colors.blueGrey[900],

                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 7,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 5),

                                  Text(
                                    'Stater set overview',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '3 of 5 projects created',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,

                                    children: [
                                      Icon(CupertinoIcons.folder_badge_plus),
                                      SizedBox(width: 5),
                                      Icon(CupertinoIcons.folder),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 7,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Get full access',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text("🚀"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> isLoggedIn(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_login',isLogin);

  }

  Widget divider({double thickness = 1.0, double height = 1.0}) {
    return Divider(
      color: Colors.grey.shade300,
      thickness: thickness,
      height: height,
    );
  }
}
