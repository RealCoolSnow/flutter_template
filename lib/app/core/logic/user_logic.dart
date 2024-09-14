import 'package:common/event.dart';
import 'package:flutter_template/app/core/app_event.dart';
import 'package:flutter_template/app/core/app_singletons.dart';
import 'package:flutter_template/app/data/local/preference/preference_key.dart';
import 'package:flutter_template/app/data/services/model/response/user/login_resp.dart';

class UserLogic {
  Future<String> getToken() async {
    return await preferenceManager.getString(PreferenceKey.token);
  }

  Future<void> loginSuccess(LoginResp resp) async {
    await preferenceManager.setString(PreferenceKey.token, resp.accessToken);
    appEvent.fire(UserLoggedEvent());
  }
}
