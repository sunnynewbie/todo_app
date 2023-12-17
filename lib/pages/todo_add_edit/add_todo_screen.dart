import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/util/app_utils.dart';
import 'package:todo_list/util/date_extension.dart';
import 'package:todo_list/util/model/todo_model.dart';
import 'package:todo_list/widget/app_dropdown.dart';
import 'package:todo_list/widget/edit_text.dart';
import 'package:todo_list/widget/text_view.dart';

class AddEditTodoScreen extends StatelessWidget {
  final TodoModel? todoModel;

  const AddEditTodoScreen({super.key, this.todoModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddEditTodoController(todoModel: todoModel),
      builder: (_) => SizedBox(
        height: Get.height / 1.5,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextView(
                      text: "${todoModel != null ? "Edit" : "Add"} TODO",
                      textStyle: Get.theme.textTheme.bodyLarge
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    EditText(
                      controller: _.titleCtrl,
                      label: "Title",
                      height: 45,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    EditText(
                      controller: _.descCtrl,
                      label: "Description",
                      minLine: 4,
                      maxLine: 7,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        var date = await AppUtils.pickDateTimeAndTimeDialog(
                            currentdate: _.time.value);
                        if (date != null) {
                          _.time.value = date;
                          _.dateCtrl.text = _.time.value!.getDateTimestr;
                        }
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: EditText(
                          controller: _.dateCtrl,
                          label: "Task time",
                          height: 45,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppDropDown(
                      hint: "Please select Time limit (In minutes)",
                      items: ['1', '2', '3', '4', '5']
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: TextView(
                                  text:
                                      "${e} ${e == "1" ? " Minute" : " Minutes"}"),
                            ),
                          )
                          .toList(),
                      onChange: (type) {},
                      validator: (value) {
                        if (value == null) {
                          return "Please select task timer";
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: TextView(
                              text: 'Cancel',
                              textStyle: Get.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var response = await _.addUpdateTodo();
                            Get.back(result: response);
                          },
                          child: TextView(
                              text: 'Save',
                              textStyle: Get.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
