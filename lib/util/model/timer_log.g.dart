// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerLog _$TimerLogFromJson(Map<String, dynamic> json) => TimerLog(
      id: const NumConverter().fromJson(json['id']),
      todo_id: const NumConverter().fromJson(json['todo_id']),
      time: const DateConverter().fromJson(json['time']),
      difference: const NumConverter().fromJson(json['difference']),
      status: $enumDecode(_$TodoStatusEnumMap, json['status'],
          unknownValue: TodoStatus.created),
    );

Map<String, dynamic> _$TimerLogToJson(TimerLog instance) => <String, dynamic>{
      'todo_id': const NumConverter().toJson(instance.todo_id),
      'time': const DateConverter().toJson(instance.time),
      'status': _$TodoStatusEnumMap[instance.status]!,
    };

const _$TodoStatusEnumMap = {
  TodoStatus.progress: 'progress',
  TodoStatus.created: 'created',
  TodoStatus.completed: 'completed',
};
