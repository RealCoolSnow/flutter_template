import 'package:json_annotation/json_annotation.dart';

part 'login_result_model.g.dart';

@JsonSerializable()
class LoginResultModel {
  final int userId;
  final String token;

  LoginResultModel({
    required this.userId,
    required this.token,
  });

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultModelToJson(this);
}
