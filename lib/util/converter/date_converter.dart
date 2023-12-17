import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime, dynamic> {
  @override
  DateTime fromJson(json) {
    if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json);
    }
    if (json is String) {
      return DateTime.tryParse(json) ?? DateTime.now();
    }
    return DateTime.now();
  }

  @override
  toJson(DateTime object) {
    return object.millisecondsSinceEpoch;
  }

  const DateConverter();
}
