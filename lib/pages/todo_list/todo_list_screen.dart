import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_screen.dart';
import 'package:todo_list/pages/todo_list/todo_item.dart';
import 'package:todo_list/pages/todo_list/todo_list_controller.dart';
import 'package:todo_list/routes.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TodoListController(),
        builder: (_) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                _.addUpdateTodo();
              },
              child: Icon(
                Icons.add,
              ),
              mini: true,
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("Work ToDo"),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                _.getTodos();
              },
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    var model = _.todos.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.detail,arguments: model);
                      },
                      child: TodoItem(
                        todoModel: model,
                        onButtonClick: (action) async {
                          var data = model;

                          switch (action) {
                            case ButtonAction.start:
                              var response = await _.updateTodoStatus(data);
                              if (response != null) {
                                _.todos[index] = response;
                                _.todos.refresh();
                              }
                              break;
                            case ButtonAction.stop:
                                model.status = TodoStatus.completed;

                                var response = await _.stopTodo(data);
                                if (response != null) {
                                  _.todos[index] = response;
                                  _.todos.refresh();
                                }
                              break;
                            case ButtonAction.cancel:
                              _.deleteTodoStatus(model);

                              break;
                            case ButtonAction.edit:
                              _.addUpdateTodo(todoModel: model);
                              break;
                          }
                        },
                      ),
                    );
                  },
                  itemCount: _.todos.length,
                ),
              ),
            ),
          );
        });
  }
}
