
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_sqlite_model.freezed.dart';
part 'todo_sqlite_model.g.dart';

@freezed
class TodoSqliteModel with _$TodoSqliteModel{
  factory TodoSqliteModel({
    int? id,
    required String title,
    required String description,
    required DateTime dateEnd
  }) = _TodoSqliteModel;

  factory TodoSqliteModel.fromJson(Map<String,dynamic> json)=> _$TodoSqliteModelFromJson(json);
}