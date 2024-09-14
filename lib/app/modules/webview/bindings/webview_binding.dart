import 'package:get/get.dart';
import 'package:flutter_template/app/modules/webview/controllers/webview_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewController>(
      () => WebViewController(),
    );
  }
}
