import 'package:get/get.dart';

import '../../../core/styles/app_textstyle.dart';
import '/app/common_import.dart';
import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends BaseView<FavoriteController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: tr(LocaleKeys.favorite),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Obx(() => Text(
              tr(LocaleKeys.click_me,
                  namedArgs: {'count': controller.count.toString()}),
              style: AppTextStyle.baseBold,
            )),
        onTap: () => controller.increment(),
      ),
    );
  }
}
