import 'package:flutter_template/app/data/services/model/request/user/login_req.dart';
import 'package:flutter_template/app/data/services/model/response/user/login_resp.dart';
import 'package:flutter_template/network/base/http_api.dart';
import 'package:flutter_template/network/model/base/base_resp.dart';

import '../model/request/user/register_req.dart';

const String prefix = "/v1";

abstract class _UserApi {
  static const String API_LOGIN = "$prefix/user/login";
}

class ApiV1 {
  Future<BaseResp<void>> health() async => httpGet("/health");
  // 用户登录
  Future<BaseResp<LoginResp?>> login(LoginReq req) async =>
      httpPost(_UserApi.API_LOGIN,
          postData: req.toJson(),
          dataParse: ((data) => LoginResp.fromJson(data)));
  // 用户注册
  Future<BaseResp<void>> register(RegisterReq req) async =>
      httpPost("$prefix/user/register", postData: req.toJson());
}
