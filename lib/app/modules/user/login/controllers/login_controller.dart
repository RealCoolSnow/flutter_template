import 'package:common/common_lib.dart';
import 'package:flutter_template/app/core/app_event.dart';
import 'package:flutter_template/app/data/services/model/request/user/login_req.dart';
import 'package:flutter_template/app/data/services/model/request/user/register_req.dart';
import 'package:flutter_template/flavors/build_config.dart';

import '/app/common_import.dart';
import 'package:flutter_template/app/core/base/controller/base_controller.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoginEnabled = false.obs;

  EventSubscription? userLoggedSubscription;
  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(_updateLoginButtonState);
    passwordController.addListener(_updateLoginButtonState);
    userLoggedSubscription = appEvent.on<UserLoggedEvent>((event) {
      $logger.i("user logged in");
    });
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    userLoggedSubscription?.cancel();
    super.onClose();
  }

  void _updateLoginButtonState() {
    isLoginEnabled.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void login(BuildContext context) {
    if (!isLoginEnabled.value) {
      return;
    }
    final username = usernameController.text;
    final password = passwordController.text;
    // 在这里实现登录逻辑
    //用户名或密码为空
    if (username.isEmpty || password.isEmpty) {
      ToastUtil.show('用户名或密码不能为空');
      return;
    }
    $logger.d('用户名: $username, 密码: $password');

    // 可以添加验证、API调用等
    loadingUtil.showLoading(context);
    apiV1.login(LoginReq(email: username, password: password)).then((resp) {
      loadingUtil.dismiss();
      if (resp.isSuccess()) {
        ToastUtil.show('登录成功');
        userLogic.loginSuccess(resp.data!);
      } else {
        ToastUtil.show('登录失败: ${resp.msg}');
      }
    }).catchError((e) {
      loadingUtil.dismiss();
      ToastUtil.show('登录失败: $e');
    });
  }

  void register(BuildContext context) {
    if (!isLoginEnabled.value) {
      return;
    }
    final username = usernameController.text;
    final password = passwordController.text;
    // 在这里实现登录逻辑
    //用户名或密码为空
    if (username.isEmpty || password.isEmpty) {
      ToastUtil.show('用户名或密码不能为空');
      return;
    }
    $logger.d('用户名: $username, 密码: $password');

    // 可以添加验证、API调用等
    loadingUtil.showLoading(context);
    apiV1
        .register(RegisterReq(email: username, password: password))
        .then((resp) {
      loadingUtil.dismiss();
      if (resp.isSuccess()) {
        ToastUtil.show('注册成功');
      } else {
        ToastUtil.show('注册失败: ${resp.msg}');
      }
    }).catchError((e) {
      loadingUtil.dismiss();
      ToastUtil.show('注册失败: $e');
    });
  }
}
