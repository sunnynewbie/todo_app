import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/util/database/database_helper.dart';
import 'package:todo_list/util/model/todo_model.dart';

enum TodoStatus {
  progress,
  created,
  completed,
}

class AddEditTodoController extends GetxController {
  TodoModel? todoModel;


  AddEditTodoController({this.todoModel});

  var titleCtrl = TextEditingController();
  var descCtrl = TextEditingController();
  var dateCtrl = TextEditingController();
  Rxn<DateTime> time = Rxn();

  addUpdateTodo() async {
    TodoModel todoModel = TodoModel.fromJson({
      "title": titleCtrl.text.trim(),
      "description": descCtrl.text.trim(),
      "dateTime": dateCtrl.text.trim(),
      "status": TodoStatus.created,
    });
    var response = await DatabaseHelper().addUpdateTodo(todoModel);
    if (response) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    super.onInit();

    if(todoModel!=null){

    }
  }
}
