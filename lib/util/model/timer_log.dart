import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/pages/todo_add_edit/add_todo_controller.dart';
import 'package:todo_list/util/converter/date_converter.dart';
import 'package:todo_list/util/converter/num_converter.dart';

part 'timer_log.g.dart';

@JsonSerializable(converters: [
  NumConverter(),
  DateConverter(),
])
class TimerLog {
  @JsonKey(includeToJson: false, includeFromJson: true)
  num id;
  num todo_id;
  DateTime time;
  @JsonKey(unknownEnumValue: TodoStatus.created)
  TodoStatus status;
  @JsonKey(includeToJson: false, includeFromJson: true)
  num difference;

  TimerLog(
      {required this.id,
      required this.todo_id,
      required this.time,
      required this.difference,
      required this.status});

  factory TimerLog.fromJson(Map<String, dynamic> json) =>
      _$TimerLogFromJson(json);

  Map<String, dynamic> toJson() => _$TimerLogToJson(this);
}
