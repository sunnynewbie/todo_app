import 'package:json_annotation/json_annotation.dart';

class StringConverter implements JsonConverter<String, dynamic> {
  @override
  String fromJson(json) {
    if (json != null) {
      return json.toString();
    }
    return '';
  }

  @override
  toJson(String object) {
    return object;
  }

  const StringConverter();
}
