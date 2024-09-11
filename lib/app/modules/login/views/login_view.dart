import 'package:flutter/material.dart';
import 'package:flutter_template/app/common_import.dart';
import 'package:flutter_template/app/core/base/view/base_view.dart';
import 'package:flutter_template/app/core/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import '../../../core/widget/input/common_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextField(
            controller: controller.usernameController,
            labelText: tr(LocaleKeys.account),
          ),
          const SizedBox(height: 16),
          CommonTextField(
            controller: controller.passwordController,
            labelText: tr(LocaleKeys.password),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          Obx(() => ElevatedButton(
                onPressed:
                    controller.isLoginEnabled.value ? controller.login : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.isLoginEnabled.value
                      ? Theme.of(context).primaryColor
                      : Colors.red[600],
                  foregroundColor: controller.isLoginEnabled.value
                      ? Colors.white
                      : Colors.red[600],
                ),
                child: const Text('登录'),
              )),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: tr(LocaleKeys.login),
    );
  }
}
