import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/util/date_extension.dart';
import 'package:todo_list/util/model/todo_model.dart';
import 'package:todo_list/widget/text_view.dart';

import 'todo_detail_controller.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoModel? todoModel;

  const TodoDetailScreen({super.key, this.todoModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TodoDetailController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const TextView(text: "Details"),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextView(
                    text: "Task title: ",
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  TextView(text: _.todo.value?.title ?? ''),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextView(
                    text: "Task description: ",
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  TextView(
                    text: _.todo.value?.description ?? '',
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const TextView(
                    text: "Total time spent: ",
                    textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  TextView(
                    text: _.todo.value?.description ?? '',
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextView(
                    text: "Timer log: ",
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => ListView.builder(
                      itemCount: _.timerLogs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var model = _.timerLogs.elementAt(index);
                        String title = "";
                        if (model.status == TodoStatus.progress) {
                          title =
                              "Task started at ${model.time.getDateTimestr} ";
                        } else {
                          title =
                              "Task stopped at ${model.time.getDateTimestr} ";
                        }
                        return ListTile(
                          title: TextView(text: title),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
