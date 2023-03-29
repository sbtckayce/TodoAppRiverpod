// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoFirebaseModel _$$_TodoFirebaseModelFromJson(Map<String, dynamic> json) =>
    _$_TodoFirebaseModel(
      id: json['id'] as String?,
      title: json['title'] as String,
      isComplete: json['isComplete'] as bool? ?? false,
      dateEnd: (json['dateEnd'] as Timestamp).toDate(),
      timeStart: json['timeStart'] as String,
      timeEnd: json['timeEnd'] as String,
      remind: json['remind'] as int,
      color: json['color'] as int,
      repeat: json['repeat'] as String,
    );

Map<String, dynamic> _$$_TodoFirebaseModelToJson(
        _$_TodoFirebaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isComplete': instance.isComplete,
      'dateEnd': instance.dateEnd.toLocal(),
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'remind': instance.remind,
      'color': instance.color,
      'repeat': instance.repeat,
    };
