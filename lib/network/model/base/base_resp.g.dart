// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResp<T> _$BaseRespFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResp<T>(
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$BaseRespToJson<T>(
  BaseResp<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
