import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_firebase_model.freezed.dart';
part 'todo_firebase_model.g.dart';

@freezed
class TodoFirebaseModel with _$TodoFirebaseModel {
  factory TodoFirebaseModel({
   
    String? id,
    required String title,
    @Default(false) bool isComplete,
    required DateTime dateEnd,
    required String timeStart,
    required String timeEnd,
    required int remind,
    required int color,
    required String repeat

  }) = _TodoFirebaseModel;

  factory TodoFirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoFirebaseModelFromJson(json);
}
