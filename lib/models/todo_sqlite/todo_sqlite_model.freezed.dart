// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_sqlite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoSqliteModel _$TodoSqliteModelFromJson(Map<String, dynamic> json) {
  return _TodoSqliteModel.fromJson(json);
}

/// @nodoc
mixin _$TodoSqliteModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dateEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoSqliteModelCopyWith<TodoSqliteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoSqliteModelCopyWith<$Res> {
  factory $TodoSqliteModelCopyWith(
          TodoSqliteModel value, $Res Function(TodoSqliteModel) then) =
      _$TodoSqliteModelCopyWithImpl<$Res, TodoSqliteModel>;
  @useResult
  $Res call({int? id, String title, String description, DateTime dateEnd});
}

/// @nodoc
class _$TodoSqliteModelCopyWithImpl<$Res, $Val extends TodoSqliteModel>
    implements $TodoSqliteModelCopyWith<$Res> {
  _$TodoSqliteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? dateEnd = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoSqliteModelCopyWith<$Res>
    implements $TodoSqliteModelCopyWith<$Res> {
  factory _$$_TodoSqliteModelCopyWith(
          _$_TodoSqliteModel value, $Res Function(_$_TodoSqliteModel) then) =
      __$$_TodoSqliteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String title, String description, DateTime dateEnd});
}

/// @nodoc
class __$$_TodoSqliteModelCopyWithImpl<$Res>
    extends _$TodoSqliteModelCopyWithImpl<$Res, _$_TodoSqliteModel>
    implements _$$_TodoSqliteModelCopyWith<$Res> {
  __$$_TodoSqliteModelCopyWithImpl(
      _$_TodoSqliteModel _value, $Res Function(_$_TodoSqliteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? dateEnd = null,
  }) {
    return _then(_$_TodoSqliteModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoSqliteModel implements _TodoSqliteModel {
  _$_TodoSqliteModel(
      {this.id,
      required this.title,
      required this.description,
      required this.dateEnd});

  factory _$_TodoSqliteModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoSqliteModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime dateEnd;

  @override
  String toString() {
    return 'TodoSqliteModel(id: $id, title: $title, description: $description, dateEnd: $dateEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoSqliteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dateEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoSqliteModelCopyWith<_$_TodoSqliteModel> get copyWith =>
      __$$_TodoSqliteModelCopyWithImpl<_$_TodoSqliteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoSqliteModelToJson(
      this,
    );
  }
}

abstract class _TodoSqliteModel implements TodoSqliteModel {
  factory _TodoSqliteModel(
      {final int? id,
      required final String title,
      required final String description,
      required final DateTime dateEnd}) = _$_TodoSqliteModel;

  factory _TodoSqliteModel.fromJson(Map<String, dynamic> json) =
      _$_TodoSqliteModel.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get dateEnd;
  @override
  @JsonKey(ignore: true)
  _$$_TodoSqliteModelCopyWith<_$_TodoSqliteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
