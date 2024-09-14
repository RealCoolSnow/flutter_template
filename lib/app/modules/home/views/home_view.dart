import 'package:get/get.dart';
import 'package:flutter_template/app/core/app_locale.dart';

import '../../../core/styles/app_size.dart';
import '../../../core/styles/app_textstyle.dart';
import '/app/common_import.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: $locale.t(LocaleKeys.home),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          child: Obx(() => Text(
                $locale.t(LocaleKeys.click_me,
                    namedArgs: {'count': controller.count.toString()}),
                style: AppTextStyle.lgBold,
              )),
          onTap: () => controller.increment(),
        ),
        Padding(
            padding: EdgeInsets.only(top: AppSize.padding),
            child: ElevatedButton(
              onPressed: () => controller.login(),
              child: Text($locale.t(LocaleKeys.user_login)),
            )),
        Padding(
            padding: EdgeInsets.only(top: AppSize.padding),
            child: ElevatedButton(
              onPressed: () => controller.pagingDemo(),
              child: const Text("Paging Demo"),
            )),
        Padding(
          padding: EdgeInsets.only(top: AppSize.padding),
          child: ElevatedButton(
            onPressed: () => controller.showLaunchTime(),
            child: const Text("Launch Time"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSize.padding),
          child: ElevatedButton(
            onPressed: () => controller.showWebView(),
            child: const Text("WebView"),
          ),
        )
      ]),
    );
  }
}
