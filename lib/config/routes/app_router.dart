import 'package:flutter/material.dart';
import 'package:flutter_web_practical_task/config/routes/app_routes.dart';
import 'package:flutter_web_practical_task/features/dashboard/presentation/view/dashboard_screen.dart';
import 'package:flutter_web_practical_task/features/setting/presentation/view/setting_screen.dart';
import 'package:flutter_web_practical_task/features/users/presentation/view/users_screen.dart';

class AppRouter {
  Route? onGenerateRoute(
    RouteSettings settings,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return _getPageRoute(child: DashboardScreen(), settings: settings);

      case AppRoutes.users:
        return _getPageRoute(child: UsersScreen(), settings: settings);
      case AppRoutes.settings:
        return _getPageRoute(child: SettingScreen(), settings: settings);
      default:
        return _getPageRoute(
          child: Scaffold(body: Center(child: Text("Page not found"))),
          settings: settings,
        );
    }
  }

  PageRoute _getPageRoute({
    required Widget child,
    required RouteSettings settings,
  }) {
    return _FadeRoute(
      child: child,
      routeName: settings.name,
      arguments: settings.arguments,
    );
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  final Object? arguments;

  _FadeRoute({
    required this.child,
    required this.routeName,
    required this.arguments,
  }) : super(
         settings: RouteSettings(name: routeName, arguments: arguments),
         pageBuilder: (context, animation, secondaryAnimation) {
           return child;
         },
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeTransition(opacity: animation, child: child);
         },
       );
}
