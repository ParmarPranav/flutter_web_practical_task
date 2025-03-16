import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/features/setting/presentation/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/drawer/main_drawer.dart';
import '../../../../responsive_layout.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  static final SettingController controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ? _defaultAppBarWidget()
              : null,
      body: ResponsiveLayout(
        mobile: _buildMobileView(),
        tablet: _buildTabletView(),
        desktop: _buildDesktopView(),
      ),
    );
  }

  AppBar _defaultAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Setting',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  Widget _buildMobileView() {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return SingleChildScrollView(
      child: Container(
        color: isLightTheme ?Colors.grey.shade50:Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.99,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.settings, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(children: [
                                Text('Dark Mode'),
                                SizedBox(width: 10,),
                                Obx(
                                      () => CupertinoSwitch(
                                    value: controller.isDarkMode.value,
                                    onChanged: controller.toggleDarkMode,
                                  ),
                                ),

                              ],),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabletView() {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return SingleChildScrollView(
      child: Container(
        color: isLightTheme ?Colors.grey.shade50:Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.99,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.settings, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(children: [
                      Text('Dark Mode'),
                      SizedBox(width: 10,),
                      Obx(
                            () => CupertinoSwitch(
                          value: controller.isDarkMode.value,
                          onChanged: controller.toggleDarkMode,
                        ),
                      ),

                    ],),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopView() {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return SingleChildScrollView(
      child: Container(
        color: isLightTheme ?Colors.grey.shade50:Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.99,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.settings, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.sort_up, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'Manage',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(CupertinoIcons.share, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(CupertinoIcons.ellipsis, size: 18),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(children: [
                  Text('Dark Mode'),
                  SizedBox(width: 10,),
                  Obx(
                        () => CupertinoSwitch(
                      value: controller.isDarkMode.value,
                      onChanged: controller.toggleDarkMode,
                    ),
                  ),
                ],),
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
