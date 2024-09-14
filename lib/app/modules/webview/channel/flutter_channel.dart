import 'dart:convert';
import 'package:common/utils/common_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/common_import.dart';
import 'package:flutter_template/flavors/build_config.dart';
import 'flutter_channel_api.dart';

class FlutterChannel {
  FlutterChannelAPI channelApi = FlutterChannelAPI();
  void init(BuildContext _context, InAppWebViewController _controller,
      Function(String, Map<String, String>) _callback) {
    channelApi.init(_context, _controller, _callback);
    //--- toast
    _controller.addJavaScriptHandler(
        handlerName: FlutterChannelAPI.API_toast,
        callback: (args) => scriptHandler(FlutterChannelAPI.API_toast, args));
    //--- API_finish_page
    _controller.addJavaScriptHandler(
        handlerName: FlutterChannelAPI.API_finish_page,
        callback: (args) =>
            scriptHandler(FlutterChannelAPI.API_finish_page, args));
    //--- API_go_home
    _controller.addJavaScriptHandler(
        handlerName: FlutterChannelAPI.API_go_home,
        callback: (args) => scriptHandler(FlutterChannelAPI.API_go_home, args));
    _controller.addJavaScriptHandler(
        handlerName: FlutterChannelAPI.API_open_url,
        callback: (args) =>
            scriptHandler(FlutterChannelAPI.API_open_url, args));
  }

  String scriptHandler(api, args) {
    $logger.d('FlutterChannel scriptHandler:$api $args');
    bool ret = false;
    if (api == FlutterChannelAPI.API_finish_page) {
      ret = channelApi.finishPage();
    } else if (api == FlutterChannelAPI.API_go_home) {
      ret = channelApi.goHome();
    } else {
      //带参数
      var data = json.decode(args[0]);
      switch (api) {
        case FlutterChannelAPI.API_open_url:
          ret = channelApi.openUrl(data['url']);
          break;
        case FlutterChannelAPI.API_toast:
          ret = channelApi.toast(data['message']);
          break;
      }
    }

    return json.encode({'success': ret});
  }
}
