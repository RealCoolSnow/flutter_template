// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterReq _$UserRegisterReqFromJson(Map<String, dynamic> json) =>
    UserRegisterReq(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterReqToJson(UserRegisterReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
