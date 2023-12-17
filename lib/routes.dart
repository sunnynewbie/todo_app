import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/dashboard/dashboard_screen.dart';
import 'package:todo_list/pages/detail/to_do_details_screen.dart';
import 'package:todo_list/pages/splash/splash_screen.dart';
import 'package:todo_list/pages/to_do_setting/todo_setting_screen.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_screen.dart';

class AppRoute {
  static const splash = '/';
  static const main = '/main';
  static const add_todo = '/add_todo';
  static const detail = 'todo_detail';
  static const setting = 'setting';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var pages = {
      splash:
          GetPageRoute(page: () => const SplashScreen(), settings: settings),
      main:
          GetPageRoute(page: () => const DashboardScreen(), settings: settings),
      add_todo: GetPageRoute(
          page: () => const AddEditTodoScreen(), settings: settings),
      detail: GetPageRoute(
          page: () => const TodoDetailScreen(), settings: settings),
      setting: GetPageRoute(
          page: () => const TodoSettingScreen(), settings: settings)
    };

    return pages[settings.name];
  }
}
