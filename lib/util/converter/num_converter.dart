import 'package:json_annotation/json_annotation.dart';

class NumConverter implements JsonConverter<num, dynamic> {
  @override
  num fromJson(json) {
    if (json != null) {
      return num.tryParse(json.toString()) ?? -1;
    }
    return -1;
  }

  @override
  toJson(num object) {
    return object;
  }

  const NumConverter();
}
