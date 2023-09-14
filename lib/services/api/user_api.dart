import '/services/base/http_api.dart';
import '/services/model/response/base/base_resp.dart';
import '/services/model/response/user/login_result_model.dart';

class UserApi {
  static const String API_LOGIN = "/login";
  // 登录
  Future<BaseResp<LoginResultModel?>> login(
          {required String username, required String password}) async =>
      httpPost(API_LOGIN,
          postData: {'username': username, 'password': password},
          dataParse: ((data) => LoginResultModel.fromJson(data)));
}
