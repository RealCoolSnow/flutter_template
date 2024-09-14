import 'package:common/common_lib.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/common_import.dart';

class FlutterChannelAPI {
  static const API_toast = 'toast';
  static const API_finish_page = 'finish_page';
  static const API_go_home = 'go_home';
  static const API_open_url = 'open_url';

  late BuildContext context;
  late InAppWebViewController controller;
  late Function(String, Map<String, String>) callback;
  void init(BuildContext _context, InAppWebViewController _controller,
      Function(String, Map<String, String>) _callback) {
    context = _context;
    controller = _controller;
    callback = _callback;
  }

  bool toast(String message) {
    ToastUtil.show(message);
    return true;
  }

  bool openUrl(String url) {
    openUrlExternal(context, Uri.parse(url));
    return true;
  }

  bool finishPage() {
    Get.back();
    return true;
  }

  bool goHome() {
    Get.back();
    return true;
  }
}
