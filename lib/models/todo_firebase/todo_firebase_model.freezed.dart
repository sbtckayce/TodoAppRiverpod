// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_firebase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoFirebaseModel _$TodoFirebaseModelFromJson(Map<String, dynamic> json) {
  return _TodoFirebaseModel.fromJson(json);
}

/// @nodoc
mixin _$TodoFirebaseModel {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  DateTime get dateEnd => throw _privateConstructorUsedError;
  String get timeStart => throw _privateConstructorUsedError;
  String get timeEnd => throw _privateConstructorUsedError;
  int get remind => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  String get repeat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoFirebaseModelCopyWith<TodoFirebaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFirebaseModelCopyWith<$Res> {
  factory $TodoFirebaseModelCopyWith(
          TodoFirebaseModel value, $Res Function(TodoFirebaseModel) then) =
      _$TodoFirebaseModelCopyWithImpl<$Res, TodoFirebaseModel>;
  @useResult
  $Res call(
      {String? id,
      String title,
      bool isComplete,
      DateTime dateEnd,
      String timeStart,
      String timeEnd,
      int remind,
      int color,
      String repeat});
}

/// @nodoc
class _$TodoFirebaseModelCopyWithImpl<$Res, $Val extends TodoFirebaseModel>
    implements $TodoFirebaseModelCopyWith<$Res> {
  _$TodoFirebaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? isComplete = null,
    Object? dateEnd = null,
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? remind = null,
    Object? color = null,
    Object? repeat = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      remind: null == remind
          ? _value.remind
          : remind // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoFirebaseModelCopyWith<$Res>
    implements $TodoFirebaseModelCopyWith<$Res> {
  factory _$$_TodoFirebaseModelCopyWith(_$_TodoFirebaseModel value,
          $Res Function(_$_TodoFirebaseModel) then) =
      __$$_TodoFirebaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      bool isComplete,
      DateTime dateEnd,
      String timeStart,
      String timeEnd,
      int remind,
      int color,
      String repeat});
}

/// @nodoc
class __$$_TodoFirebaseModelCopyWithImpl<$Res>
    extends _$TodoFirebaseModelCopyWithImpl<$Res, _$_TodoFirebaseModel>
    implements _$$_TodoFirebaseModelCopyWith<$Res> {
  __$$_TodoFirebaseModelCopyWithImpl(
      _$_TodoFirebaseModel _value, $Res Function(_$_TodoFirebaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? isComplete = null,
    Object? dateEnd = null,
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? remind = null,
    Object? color = null,
    Object? repeat = null,
  }) {
    return _then(_$_TodoFirebaseModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      remind: null == remind
          ? _value.remind
          : remind // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoFirebaseModel implements _TodoFirebaseModel {
  _$_TodoFirebaseModel(
      {this.id,
      required this.title,
      this.isComplete = false,
      required this.dateEnd,
      required this.timeStart,
      required this.timeEnd,
      required this.remind,
      required this.color,
      required this.repeat});

  factory _$_TodoFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoFirebaseModelFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  final DateTime dateEnd;
  @override
  final String timeStart;
  @override
  final String timeEnd;
  @override
  final int remind;
  @override
  final int color;
  @override
  final String repeat;

  @override
  String toString() {
    return 'TodoFirebaseModel(id: $id, title: $title, isComplete: $isComplete, dateEnd: $dateEnd, timeStart: $timeStart, timeEnd: $timeEnd, remind: $remind, color: $color, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoFirebaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd) &&
            (identical(other.remind, remind) || other.remind == remind) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.repeat, repeat) || other.repeat == repeat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isComplete, dateEnd,
      timeStart, timeEnd, remind, color, repeat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoFirebaseModelCopyWith<_$_TodoFirebaseModel> get copyWith =>
      __$$_TodoFirebaseModelCopyWithImpl<_$_TodoFirebaseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoFirebaseModelToJson(
      this,
    );
  }
}

abstract class _TodoFirebaseModel implements TodoFirebaseModel {
  factory _TodoFirebaseModel(
      {final String? id,
      required final String title,
      final bool isComplete,
      required final DateTime dateEnd,
      required final String timeStart,
      required final String timeEnd,
      required final int remind,
      required final int color,
      required final String repeat}) = _$_TodoFirebaseModel;

  factory _TodoFirebaseModel.fromJson(Map<String, dynamic> json) =
      _$_TodoFirebaseModel.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  bool get isComplete;
  @override
  DateTime get dateEnd;
  @override
  String get timeStart;
  @override
  String get timeEnd;
  @override
  int get remind;
  @override
  int get color;
  @override
  String get repeat;
  @override
  @JsonKey(ignore: true)
  _$$_TodoFirebaseModelCopyWith<_$_TodoFirebaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
