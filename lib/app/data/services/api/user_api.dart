import '/app/data/services/model/user/login_result_model.dart';
import '/network/base/http_api.dart';
import '/network/model/base/base_resp.dart';

class UserApi {
  static const String API_LOGIN = "/login";
  // 登录
  Future<BaseResp<LoginResultModel?>> login(
          {required String username, required String password}) async =>
      httpPost(API_LOGIN,
          postData: {'username': username, 'password': password},
          dataParse: ((data) => LoginResultModel.fromJson(data)));
}
