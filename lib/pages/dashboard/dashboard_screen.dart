import 'package:flutter/material.dart';
import 'package:todo_list/pages/to_do_setting/todo_setting_screen.dart';
import 'package:todo_list/pages/todo_list/todo_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: const [
          TodoListScreen(),
          TodoSettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Todos"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Setting"),
        ],
      ),
    );
  }
}
