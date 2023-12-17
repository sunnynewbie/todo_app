import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/util/date_extension.dart';
import 'package:todo_list/util/model/todo_model.dart';
import 'package:todo_list/widget/text_view.dart';

enum ButtonAction { start, stop, cancel, edit }

class TodoItem extends StatelessWidget {
  final TodoModel todoModel;
  final void Function(ButtonAction action)? onButtonClick;

  const TodoItem({super.key, this.onButtonClick, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Get.theme.primaryColor.withOpacity(.10),
              blurRadius: 5,
              spreadRadius: 5),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: todoModel.title,
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextView(
                  text: todoModel.description,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextView(text: 'Current status: ${todoModel.status.name.capitalizeFirst}'),
                const SizedBox(
                  height: 5,
                ),
                TextView(
                    text: "Task time : ${todoModel.dateTime.getDateTimestr}"),
              ],
            ),
          ),
          PopupMenuButton<ButtonAction>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextView(text: "Start"),
                value: ButtonAction.start,
              ),
              PopupMenuItem(
                  child: TextView(text: "Pause"), value: ButtonAction.stop),
              PopupMenuItem(
                child: TextView(text: "Delete"),
                value: ButtonAction.cancel,
              ),
              PopupMenuItem(
                child: TextView(text: "Edit"),
                value: ButtonAction.edit,
              ),
            ],
            onSelected: (value) {
              onButtonClick?.call(value);
            },
          ),
        ],
      ),
    );
  }
}
