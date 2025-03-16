import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/features/dashboard/presentation/view/widget/trackball.dart';
import 'package:flutter_web_practical_task/features/users/presentation/view/users_screen.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/drawer/main_drawer.dart';
import '../../../../responsive_layout.dart';
import '../../../users/presentation/controllers/users_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<UsersController>().getUsersList();
  }

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
        'Dashboard',
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
        color: isLightTheme ? Colors.grey.shade50 : Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
                          Icon(CupertinoIcons.folder_solid, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'Construction',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 50,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(CupertinoIcons.house, size: 50),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                children: [
                                  Text(
                                    'House Spectrum Ltd',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .check_mark_circled,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(width: 3),
                                              Text('Certified'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.person_2_alt,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 15,
                                              ),
                                              SizedBox(width: 7),
                                              Text('Jesica Parker'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.39,
                        width: double.infinity,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: LineChartWithTrackball(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: UsersScreen(),
                      ),
                    ],
                  ),
                ),
              ],
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
        color: isLightTheme ? Colors.grey.shade50 : Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
                          Icon(CupertinoIcons.folder_solid, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'Construction',
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 50,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(CupertinoIcons.house, size: 50),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                children: [
                                  Text(
                                    'House Spectrum Ltd',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .check_mark_circled,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(width: 3),
                                              Text('Certified'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.person_2_alt,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 15,
                                              ),
                                              SizedBox(width: 7),
                                              Text('Jesica Parker'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.39,
                        width: double.infinity,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: LineChartWithTrackball(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        child: UsersScreen(),
                      ),
                    ],
                  ),
                ),
              ],
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
        color: isLightTheme ? Colors.grey.shade50 : Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
                          Icon(CupertinoIcons.folder_solid, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'Construction',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(CupertinoIcons.folder_solid, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'House Spectrum Ltd',
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 35,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(CupertinoIcons.house, size: 50),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                children: [
                                  Text(
                                    'House Spectrum Ltd',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .check_mark_circled,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(width: 3),
                                              Text('Certified'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          color:
                                              isLightTheme
                                                  ? Colors.grey.shade100
                                                  : Colors.grey.shade900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.person_2_alt,
                                                color:
                                                    isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                size: 15,
                                              ),
                                              SizedBox(width: 7),
                                              Text('Jesica Parker'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sales',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '5.3',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              isLightTheme
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 1),
                                      Text(
                                        '/10',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 70,
                                width: 9,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Profit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '2.5',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              isLightTheme
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 1),
                                      Text(
                                        '/10',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 70,
                                width: 9,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Customers',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '7.8',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              isLightTheme
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 1),
                                      Text(
                                        '/10',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 7,
                            ),
                            child: LineChartWithTrackball(),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        child: UsersScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
