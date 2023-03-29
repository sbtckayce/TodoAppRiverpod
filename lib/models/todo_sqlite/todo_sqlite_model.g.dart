// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_sqlite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoSqliteModel _$$_TodoSqliteModelFromJson(Map<String, dynamic> json) =>
    _$_TodoSqliteModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      dateEnd: DateTime.parse(json['dateEnd'] as String),
    );

Map<String, dynamic> _$$_TodoSqliteModelToJson(_$_TodoSqliteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dateEnd': instance.dateEnd.toIso8601String(),
    };
