import 'package:get/get.dart';
import 'package:flutter_template/app/routes/app_pages.dart';

class AppRouter {
  static const PARAM_URL = 'url';
  static const PARAM_TITLE = 'title';
  static void showWebView(String url, {String? title}) {
    Get.toNamed(Routes.WEBVIEW, parameters: {
      PARAM_URL: Uri.encodeComponent(url),
      PARAM_TITLE: Uri.encodeComponent(title ?? ''),
    });
  }
}
