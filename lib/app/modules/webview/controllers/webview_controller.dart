import 'package:common/utils/platform_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';
import '../../../routes/app_router.dart';

class WebViewController extends BaseController {
  final url = ''.obs;
  final title = ''.obs;
  final loadProgress = 0.obs;
  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    url.value = Uri.decodeComponent(Get.parameters[AppRouter.PARAM_URL] ?? '');
    title.value =
        Uri.decodeComponent(Get.parameters[AppRouter.PARAM_TITLE] ?? '');
  }

  void onBack() async {
    if (!PlatformUtil.isWeb && webViewController != null) {
      if (await webViewController?.canGoBack() ?? false) {
        webViewController?.goBack();
        return;
      }
    }
    Get.back();
  }
}
