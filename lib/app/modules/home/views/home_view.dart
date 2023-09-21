import '../../../core/styles/app_size.dart';
import '../../../core/styles/app_textstyle.dart';
import '/app/common_import.dart';
import 'package:flutter/material.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: tr(LocaleKeys.home),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          child: Obx(() => Text(
                tr(LocaleKeys.click_me,
                    namedArgs: {'count': controller.count.toString()}),
                style: AppTextStyle.lgBold,
              )),
          onTap: () => controller.increment(),
        ),
        Padding(
            padding: EdgeInsets.only(top: AppSize.padding),
            child: ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text("Login"),
            )),
        Padding(
            padding: EdgeInsets.only(top: AppSize.padding),
            child: ElevatedButton(
              onPressed: () => controller.pagingDemo(),
              child: const Text("Paging Demo"),
            ))
      ]),
    );
  }
}
