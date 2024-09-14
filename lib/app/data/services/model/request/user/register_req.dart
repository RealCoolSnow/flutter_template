import 'package:json_annotation/json_annotation.dart';

part 'register_req.g.dart';

@JsonSerializable()
class RegisterReq {
  final String email;
  final String password;

  RegisterReq({
    required this.email,
    required this.password,
  });

  factory RegisterReq.fromJson(Map<String, dynamic> json) =>
      _$RegisterReqFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterReqToJson(this);
}
