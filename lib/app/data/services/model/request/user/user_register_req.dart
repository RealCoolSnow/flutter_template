import 'package:json_annotation/json_annotation.dart';

part 'user_register_req.g.dart';

@JsonSerializable()
class UserRegisterReq {
  final String email;
  final String password;

  UserRegisterReq({
    required this.email,
    required this.password,
  });

  factory UserRegisterReq.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterReqToJson(this);
}
