import 'package:flutter/material.dart';
import 'package:lezatos/app/app.dart';
import 'package:lezatos/presentation/auth/login/login_screen.dart';
import 'package:lezatos/presentation/home/home_screen.dart';
import 'package:lezatos/presentation/splash/splash_screen.dart';
import 'package:lezatos/utils/constants/route_names.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    currentPath = settings.name.toString();

    switch (settings.name) {
      case RouteNames.splashRoute:
        return navigate(const SplashScreen());
      case RouteNames.homeRoute:
        return navigate(const HomeScreen());
      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      default:
        return navigate(noRoute(settings.name ?? ""));
    }
  }

  static MaterialPageRoute navigate(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);

  static Widget noRoute(String routeName) =>
      Scaffold(body: Center(child: Text("No route defined for $routeName")));
}
