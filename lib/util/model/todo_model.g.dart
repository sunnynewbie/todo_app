// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: const NumConverter().fromJson(json['id']),
      title: const StringConverter().fromJson(json['title']),
      description: const StringConverter().fromJson(json['description']),
      dateTime: const DateConverter().fromJson(json['dateTime']),
      status: $enumDecode(_$TodoStatusEnumMap, json['status'],
          unknownValue: TodoStatus.created),
      timeLimit: const StringConverter().fromJson(json['timeLimit']),
      deleted: const StringConverter().fromJson(json['deleted']),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'title': const StringConverter().toJson(instance.title),
      'description': const StringConverter().toJson(instance.description),
      'dateTime': const DateConverter().toJson(instance.dateTime),
      'status': _$TodoStatusEnumMap[instance.status]!,
      'deleted': const StringConverter().toJson(instance.deleted),
      'timeLimit': const StringConverter().toJson(instance.timeLimit),
    };

const _$TodoStatusEnumMap = {
  TodoStatus.progress: 'progress',
  TodoStatus.created: 'created',
  TodoStatus.completed: 'completed',
};
