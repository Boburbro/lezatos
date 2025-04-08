import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lezatos/app/app.dart';
import 'package:lezatos/data/local/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await LocalStorage.getInstance().shared;
  runApp(const App());
}
