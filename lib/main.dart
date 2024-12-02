import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/dependency_injector.dart';
import 'themes/theme.dart';
import 'views/i_hate_rain_game_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const IHateRainGamePage(),
    ),
  );
}
