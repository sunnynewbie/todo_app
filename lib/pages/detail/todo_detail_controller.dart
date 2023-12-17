import 'package:get/get.dart';
import 'package:todo_list/util/database/database_helper.dart';
import 'package:todo_list/util/model/timer_log.dart';
import 'package:todo_list/util/model/todo_model.dart';

class TodoDetailController extends GetxController {
  Rxn<TodoModel> todo = Rxn();
  RxList<TimerLog> timerLogs = RxList.empty();

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null && args is TodoModel) {
      todo.value = args;
    }
    super.onInit();
    getTimeLog();
  }

  Future<void> getTimeLog() async {
    var response = await DatabaseHelper().getTimerLogs();
    if (response.isNotEmpty) {
      timerLogs.assignAll(response);
    }
  }


}
