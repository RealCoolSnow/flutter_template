import 'package:get/get.dart';
import 'package:flutter_template/app/routes/app_pages.dart';

import '../../../core/base/controller/base_controller.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.MAIN);
    });
  }
}
