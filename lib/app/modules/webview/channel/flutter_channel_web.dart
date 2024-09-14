import 'dart:convert';
import 'dart:js' as js;
import 'package:common/utils/platform_util.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_template/app/common_import.dart';
import 'package:flutter_template/flavors/build_config.dart';

import 'flutter_channel_api.dart';

class FlutterChannel {
  late Function(String, Map<String, String>) callback;
  FlutterChannelAPI channelApi = FlutterChannelAPI();
  void init(BuildContext _context, InAppWebViewController _controller,
      Function(String, Map<String, String>) _callback) {
    callback = _callback;
    channelApi.init(_context, _controller, callback);
    if (PlatformUtil.isWeb) {
      js.context["onWebMessage"] = onWebMessage;
    }
  }

  String onWebMessage(jsonData) {
    bool ret = false;
    var message;
    $logger.d('FlutterChannel onWebMessage:$jsonData');
    try {
      message = json.decode(jsonData);
      switch (message['api']) {
        case FlutterChannelAPI.API_finish_page:
          ret = channelApi.finishPage();
          break;
        case FlutterChannelAPI.API_go_home:
          ret = channelApi.goHome();
          break;
        case FlutterChannelAPI.API_toast:
          ret = channelApi.toast(message['data']['message']);
          break;
        case FlutterChannelAPI.API_open_url:
          ret = channelApi.openUrl(message['data']['url']);
          break;
      }
    } catch (e) {
      $logger.e(e);
    }
    if (ret) {
      callback(message['api'], {});
    }
    return json.encode({'success': ret});
  }
}
