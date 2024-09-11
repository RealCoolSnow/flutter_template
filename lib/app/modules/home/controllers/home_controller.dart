import 'package:common/utils/toast.dart';
import '/app/core/app_singletons.dart';
import '/app/data/local/preference/preference_key.dart';

import '/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';

class HomeController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;

  void login() {
    Get.toNamed(Routes.LOGIN);
  }

  void pagingDemo() {
    Get.toNamed(Routes.PAGING_DEMO);
  }

  void showLaunchTime() {
    preferenceManager.getString(PreferenceKey.launchTime).then((value) {
      showToast(value);
    });
  }
}
