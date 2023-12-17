import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/util/converter/bool_converter.dart';
import 'package:todo_list/util/converter/date_converter.dart';
import 'package:todo_list/util/converter/num_converter.dart';
import 'package:todo_list/util/converter/string_converter.dart';

part 'todo_model.g.dart';

@JsonSerializable(converters:[
  StringConverter(),
  BoolConverter(),
  DateConverter(),
  NumConverter(),
])
class TodoModel {
  @JsonKey(includeFromJson: true,includeToJson: false)
  num id;
  String title;
  String description;
  DateTime dateTime;
  @JsonKey(unknownEnumValue: TodoStatus.created)
  TodoStatus status;
  String deleted;
  String timeLimit;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.status,
      required this.timeLimit,
      required this.deleted});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
