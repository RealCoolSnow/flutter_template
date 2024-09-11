import 'package:common/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/base/controller/base_controller.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoginEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(_updateLoginButtonState);
    passwordController.addListener(_updateLoginButtonState);
  }

  void _updateLoginButtonState() {
    isLoginEnabled.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void login() {
    final username = usernameController.text;
    final password = passwordController.text;
    // 在这里实现登录逻辑
    //用户名或密码为空
    if (username.isEmpty || password.isEmpty) {
      showToast('用户名或密码不能为空');
      return;
    }
    print('用户名: $username, 密码: $password');
    // 可以添加验证、API调用等
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
