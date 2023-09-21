import 'package:flutter_template/app/routes/app_pages.dart';

import '/app/data/services/api/user_api.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';

class HomeController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;

  void login() {
    showLoading();
    UserApi().login(username: 'abc', password: '123456').then((res) {
      hideLoading();
    }).catchError((err) {
      hideLoading();
    });
  }

  void pagingDemo() {
    Get.toNamed(Routes.PAGING_DEMO);
  }
}
