import 'dart:io';

import 'package:common/utils/platform_util.dart';
import 'package:device_info_plus/device_info_plus.dart';

class BrowserReg {
  final RegExp chrome = RegExp(r'Chrome');
  final RegExp ie = RegExp(r'MSIE');
  final RegExp firefox = RegExp(r'Firefox');
  final RegExp opera = RegExp(r'Presto');
  final RegExp safari = RegExp(r'Version\/([\d.]+).*Safari');
  final RegExp browser360 = RegExp(r'360SE');
  final RegExp qqBrowser = RegExp(r'QQ');
}

class DeviceReg {
  final RegExp iPhone = RegExp(r'iPhone');
  final RegExp iPad = RegExp(r'iPad');
  final RegExp android = RegExp(r'Android');
  final RegExp windows = RegExp(r'Windows');
  final RegExp mac = RegExp(r'Macintosh');
}

class DeviceUtil {
  static String model = "";
  static String osVersion = "";
  static String platform = "";

  static Future<void> init(
      {required bool isInWechat, required String webUserAgent}) async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (!isMobile()) {
      // if (WebUtil.isInWechat()) {
      //   platform = "wechat";
      // } else {
      platform = "web";
      //}
      var userAgentInfo = getUserAgentInfo(webUserAgent);
      osVersion = '${userAgentInfo['osName']}_${userAgentInfo['osVersion']}';
      model =
          '${userAgentInfo['browserName']}_${userAgentInfo['browserVersion']}';
      // logUtil.d(userAgentInfo);
      if (isInWechat) {
        osVersion = '${osVersion}_wechat';
      }
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      model = androidDeviceInfo.model;
      osVersion = '${androidDeviceInfo.version.sdkInt}';
      platform = "android";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      model = iosDeviceInfo.name;
      osVersion = iosDeviceInfo.systemVersion;
      platform = "ios";
    }
  }

  static Map<String, String> getUserAgentInfo(String userAgentStr) {
    final browserReg = BrowserReg();
    final deviceReg = DeviceReg();

    final userAgentObj = {
      'browserName': '',
      'browserVersion': '',
      'osName': '',
      'osVersion': '',
      'deviceName': '',
    };

    if (browserReg.chrome.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'Chrome';
      userAgentObj['browserVersion'] =
          userAgentStr.split('Chrome/')[1].split(' ')[0];
    } else if (browserReg.ie.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'IE';
      userAgentObj['browserVersion'] =
          userAgentStr.split('MSIE ')[1].split(' ')[1];
    } else if (browserReg.firefox.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'Firefox';
      userAgentObj['browserVersion'] = userAgentStr.split('Firefox/')[1];
    } else if (browserReg.opera.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'Opera';
      userAgentObj['browserVersion'] = userAgentStr.split('Version/')[1];
    } else if (browserReg.safari.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'Safari';
      userAgentObj['browserVersion'] =
          userAgentStr.split('Version/')[1].split(' ')[0];
    } else if (browserReg.browser360.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = '360';
      userAgentObj['browserVersion'] = '';
    } else if (browserReg.qqBrowser.hasMatch(userAgentStr)) {
      userAgentObj['browserName'] = 'QQBrowser';
      userAgentObj['browserVersion'] =
          userAgentStr.split('Version/')[1].split(' ')[0];
    }

    if (deviceReg.windows.hasMatch(userAgentStr)) {
      userAgentObj['osName'] = 'Windows';
      userAgentObj['osVersion'] =
          userAgentStr.split('Windows NT ')[1].split(';')[0];
    } else if (deviceReg.mac.hasMatch(userAgentStr)) {
      userAgentObj['osName'] = 'Mac';
      userAgentObj['osVersion'] =
          userAgentStr.split('Mac OS X ')[1].split(')')[0];
    } else if (deviceReg.iPhone.hasMatch(userAgentStr)) {
      userAgentObj['osName'] = 'iPhone';
      userAgentObj['osVersion'] =
          userAgentStr.split('iPhone OS ')[1].split(' ')[0];
    } else if (deviceReg.iPad.hasMatch(userAgentStr)) {
      userAgentObj['osName'] = 'iPad';
      userAgentObj['osVersion'] =
          userAgentStr.split('iPad; CPU OS ')[1].split(' ')[0];
    } else if (deviceReg.android.hasMatch(userAgentStr)) {
      userAgentObj['osName'] = 'Android';
      userAgentObj['osVersion'] =
          userAgentStr.split('Android ')[1].split(';')[0];
      userAgentObj['deviceName'] = userAgentStr
          .split('(Linux; Android ')[1]
          .split('; ')[1]
          .split(' Build')[0];
    }

    return userAgentObj;
  }

  ///
  static bool isMobile() {
    var ret = false;
    try {
      ret = Platform.isIOS || Platform.isAndroid;
    } catch (e) {
      ret = false;
    }
    return ret;
  }

  static String getName() {
    String ret = 'unknown';
    try {
      ret = Platform.operatingSystem;
    } catch (e) {
      if (PlatformUtil.isWeb) {
        ret = 'web';
      }
    }
    return ret;
  }

  // static Future<String> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   if (isMobile()) {
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo androidDeviceInfo =
  //           await deviceInfoPlugin.androidInfo;
  //       return Future.value(androidDeviceInfo.androidId);
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  //       return Future.value(iosDeviceInfo.identifierForVendor);
  //     }
  //   }
  //   var now = DateTime.now();
  //   return Future.value(now.millisecondsSinceEpoch.toString());
  // }

  // static Future<String> getDeviceInfo() async {
  //   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   if (isMobile()) {
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo androidDeviceInfo =
  //           await deviceInfoPlugin.androidInfo;
  //       Map<String, dynamic> info = {
  //         'brand': androidDeviceInfo.brand,
  //         'manufacturer': androidDeviceInfo.manufacturer,
  //         'model': androidDeviceInfo.model,
  //         'product': androidDeviceInfo.product,
  //         'sdkInt': androidDeviceInfo.version.sdkInt
  //       };
  //       return Future.value(info.toString());
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  //       Map<String, dynamic> info = {
  //         'systemName': iosDeviceInfo.systemName,
  //         'systemVersion': iosDeviceInfo.systemVersion,
  //         'model': iosDeviceInfo.model,
  //         'name': iosDeviceInfo.name,
  //         'utsname': iosDeviceInfo.utsname
  //       };
  //       return Future.value(info.toString());
  //     }
  //   }
  //   return Future.value("{}");
  // }

  // static Future<String> getIosVersion() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
  //     return Future.value(iosDeviceInfo.systemVersion);
  //   }
  //   return Future.value("");
  // }
}
