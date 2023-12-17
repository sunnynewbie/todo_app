import 'package:json_annotation/json_annotation.dart';

class BoolConverter implements JsonConverter<bool, dynamic> {
  @override
  bool fromJson(json) {
    if (json is bool) {
      return json;
    }
    if (json is int) {
      return json == 1;
    }
    return false;
  }

  @override
  toJson(bool object) {
    return object;
  }

 const BoolConverter();
}
