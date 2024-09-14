import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/app/core/app_locale.dart';
import 'package:flutter_template/app/core/styles/app_textstyle.dart';
import 'package:flutter_template/app/modules/splash/controllers/splash_controller.dart';

import '/app/common_import.dart';
import '../../../core/base/view/base_view.dart';

class SplashView extends BaseView<SplashController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget pageScaffold(BuildContext context) {
    return Stack(children: [
      Positioned(
          left: 0, right: 0, top: 0, bottom: 0, child: _buildImageSplash())
    ]);
  }

  Widget _buildImageSplash() {
    return Container(
        color: const Color(0XFF1B1B1B),
        child: Stack(
          children: [
            Image.asset(Assets.images.launcherIcon.path,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                fit: BoxFit.cover),
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: const Color(0X701B1B1B),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    $locale.t(LocaleKeys.app_name),
                    style: AppTextStyle.xl5Bold.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Hello World',
                    style: AppTextStyle.base.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
