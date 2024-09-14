@JS()
library util;

import 'package:js/js.dart';

@JS('util_getUserAgent')
external String getUserAgent();
@JS('util_redirect')
external String redirectUrl(String url);
@JS('util_isMobile')
external bool isMobile();
@JS('util_isPreview')
external bool isPreview();
@JS('util_getLocationUrl')
external String getLocationUrl();
@JS('util_toHome')
external void toHome();
@JS('util_copyText')
external bool utilCopyText(String text);
@JS('util_alert')
external void utilAlert(String content);
@JS('util_inApp')
external bool utilInApp();

class WebUtil {
  static bool isInWechat() {
    String ua = getUserAgent().toLowerCase();
    return ua.contains('micromessenger');
    // return false;
  }

  static bool isIOS() {
    String ua = getUserAgent().toLowerCase();
    return ua.contains('iphone') || ua.contains('ipad');
  }
}
