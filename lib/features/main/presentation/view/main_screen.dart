import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/bindings.dart';
import 'package:flutter_web_practical_task/common/widgets/drawer/main_drawer.dart';
import 'package:flutter_web_practical_task/config/routes/app_router.dart';

import '../../../../responsive_layout.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    AppBindings().dependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKey.currentState!.canPop()) {
          _navigatorKey.currentState!.pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: ResponsiveLayout(
          desktop: _buildWebView(screenHeight, screenWidth),
          tablet: _buildMobileTabletView(screenHeight, screenWidth),
          mobile: _buildMobileTabletView(screenHeight, screenWidth),
        ),
      ),
    );
  }

  Widget _buildMobileTabletView(double screenHeight, double screenWidth) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) => _appRouter.onGenerateRoute(settings, _navigatorKey),
    );
  }

  Widget _buildWebView(double screenHeight, double screenWidth) {
    return Row(
      children: [
        Container(
          width: 300,
          constraints: BoxConstraints(minWidth: 200),
          child: MainDrawer(
            navigatorKey: _navigatorKey,
          ),
        ),
        Expanded(
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) => _appRouter.onGenerateRoute(settings, _navigatorKey),
          ),
        )
      ],
    );
  }
}
