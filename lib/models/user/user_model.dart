import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed 
class UserModel with _$UserModel{
factory UserModel({
  required String name,
 required String uid,
 required String profilePic,
 required bool isAuthenticted,
 
}) = _UserModel;

factory UserModel.empty()=> UserModel(name: '', uid: '', profilePic: '', isAuthenticted: false);

factory UserModel.fromJson(Map<String,dynamic> json)=>_$UserModelFromJson(json);
  
}