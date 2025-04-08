import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lezatos/data/local/local_storage.dart';
import 'package:lezatos/utils/constants/route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.h,
          children: [
            const Text("Login screen"),
            FilledButton(
              onPressed: () async {
                LocalStorage.getInstance().saveUserToken("token");
                Navigator.pushNamed(context, RouteNames.splashRoute);
              },
              child: const Text("Set logined"),
            ),
          ],
        ),
      ),
    );
  }
}
