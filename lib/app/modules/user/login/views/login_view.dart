import 'package:flutter_template/app/common_import.dart';
import 'package:flutter_template/app/core/app_locale.dart';
import 'package:flutter_template/app/core/base/view/base_view.dart';
import 'package:flutter_template/app/core/widget/custom_app_bar.dart';
import '../../../../core/widget/input/common_text_field.dart';
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
            labelText: $locale.t(LocaleKeys.user_account),
            hintText: $locale.t(LocaleKeys.user_account_hint),
          ),
          const SizedBox(height: 16),
          CommonTextField(
            controller: controller.passwordController,
            labelText: $locale.t(LocaleKeys.user_password),
            hintText: $locale.t(LocaleKeys.user_password_hint),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => controller.register(context),
                child: Text($locale.t(LocaleKeys.user_register)),
              ),
              ElevatedButton(
                onPressed: () => controller.login(context),
                child: Text($locale.t(LocaleKeys.user_login)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: $locale.t(LocaleKeys.user_login),
    );
  }
}
