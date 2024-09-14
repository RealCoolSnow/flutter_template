import '/network/base/network/error_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_resp.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResp<T> {
  final String message;
  final int code;
  T? data;

  bool isSuccess() => this.code == ErrorCode.Success;

  String get msg => this.message;

  BaseResp({required this.message, required this.code, this.data});
  factory BaseResp.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$BaseRespFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseRespToJson(this, toJsonT);
}
