import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/local/data.dart';
import 'app/global/theme/my_theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final SharedPreferences _data = SharedData.pref;

  if (_data.getString('token') != null) {}

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: (_data.getString('token') != null)
          ? AppPages.INITIAL
          : AppPages.LOGIN,
      // initialBinding: AppBinding(),
      getPages: AppPages.routes,
      theme: Themes.light,
    ),
  );
}
