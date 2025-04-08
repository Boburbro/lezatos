import 'package:flutter/material.dart';
import 'package:lezatos/data/local/local_storage.dart';
import 'package:lezatos/utils/constants/route_names.dart';
import 'package:lezatos/utils/utility/app_logger_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    String accessToken = await LocalStorage.getInstance().getUserToken();
    AppLogger.warming("TOKEN ==> $accessToken");

    await Future.delayed(const Duration(seconds: 1), () {
      if (accessToken.isEmpty) {
        Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          RouteNames.loginRoute,
        );
      } else {
        Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          RouteNames.homeRoute,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 100)));
  }
}
