import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_screen.dart';
import 'package:todo_list/util/database/database_helper.dart';
import 'package:todo_list/util/model/todo_model.dart';

class TodoListController extends GetxController {
  RxList<TodoModel> todos = RxList.empty();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    var response = await DatabaseHelper().getTodos();
    todos.assignAll(response);
  }

  Future<TodoModel?> updateTodoStatus(TodoModel todos) async {
    var response = await DatabaseHelper().updateTodoStatus(todos);
    if (response != null) {
      return response;
    }
    return null;
  } Future<TodoModel?> stopTodo(TodoModel todos) async {
    var response = await DatabaseHelper().stopRunningTask(todos);
    if (response != null) {
      return response;
    }
    return null;
  }

  Future<void> deleteTodoStatus(TodoModel todo) async {
    var response = await DatabaseHelper().deleteTodo(todo);
    if (response) {
      todos.remove(todo);
    }
  }

  addUpdateTodo({TodoModel? todoModel}) async {
    var response = await Get.bottomSheet(
      const AddEditTodoScreen(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      ignoreSafeArea: false,
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
    if (response != null && response is bool && response) {
      getTodos();
    }
  }
}
