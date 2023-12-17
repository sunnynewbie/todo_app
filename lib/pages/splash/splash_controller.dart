import 'package:get/get.dart';
import 'package:todo_list/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.toNamed(AppRoute.main);
      },
    );
  }
}
