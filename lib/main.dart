import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app_theme.dart';
import 'package:todo_list/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todos',
      theme: FlexThemeData.light(
        colors: AppColor.schemeLight,
        useMaterial3: true,
        
      ),
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
