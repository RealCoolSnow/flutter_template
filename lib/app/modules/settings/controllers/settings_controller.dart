import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_locale.dart';
import '/app/core/base/base_controller.dart';

class SettingsController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;

  void switchLocale(BuildContext context) {
    $locale.setLocale(
        context,
        $locale.currentLocale == AppLocaleSupported.zhCN
            ? AppLocaleSupported.enUS
            : AppLocaleSupported.zhCN);
  }
}
