import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_locale.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/favorite/controllers/favorite_controller.dart';

class FavoriteView extends BaseView<FavoriteController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: $locale.t("favorite"),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Obx(()=>Text(
          'FavoriteView is working ${controller.count}',
          style: titleStyle,
        )),
        onTap: () => controller.increment(),
      ),
    );
  }
}
