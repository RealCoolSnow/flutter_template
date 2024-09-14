String getUserAgent() => '';
String redirectUrl(String url) => '';
bool isMobile() => true;
bool isPreview() => false;
String getLocationUrl() => '';
void toHome() => {};
bool utilCopyText(String text) => false;

class WebUtil {
  static bool isInWechat() {
    return false;
  }

  static bool isIOS() {
    return false;
  }
}
