import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils{

  static Future<DateTime?> pickDateTimeDialog(
      {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    DateTime currentDate = DateTime.now();
    initialDate = initialDate ?? DateTime.now();
    firstDate = firstDate ?? DateTime.now();
    lastDate = lastDate ?? DateTime(2030);
    DateTime? date = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      builder: (context, child) {
        return child!;
      },
    );
    if (date != null) {
      return date;
    }
    return null;
  }

  static Future<DateTime?> pickDateTimeAndTimeDialog({
    DateTime? currentdate,
  }) async {
    currentdate ??= DateTime.now();

    DateTime? date = await showDatePicker(
      context: Get.context!,
      initialDate: currentdate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      TimeOfDay? time = await pickTimePicker(currentdate: date);
      if (time != null) {
        return DateTime(
            date.year, date.month, date.day, time.hour, time.minute);
      }
      return null;
    }
    return null;
  }

  static Future<TimeOfDay?> pickTimePicker({
    DateTime? currentdate,
  }) async {
    currentdate ??= DateTime.now();

    TimeOfDay? time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      builder: (context, child) {
        return child!;
      },
    );
    if (time != null) {
      return time;
    }
    return null;
  }
}