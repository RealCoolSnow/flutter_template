import 'package:get/get.dart';
import 'package:flutter_template/app/core/app_locale.dart';
import 'package:flutter_template/app/modules/0-just-copy-it/controllers/demo_controller.dart';

import '../../../core/styles/app_textstyle.dart';
import '/app/common_import.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';

class DemoView extends BaseView<DemoController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: $locale.t(LocaleKeys.app_name),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Obx(() => Text(
              $locale.t(LocaleKeys.click_me,
                  namedArgs: {'count': controller.count.toString()}),
              style: AppTextStyle.baseBold,
            )),
        onTap: () => controller.increment(),
      ),
    );
  }
}
