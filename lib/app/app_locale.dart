import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum AppLocaleSupported { enUS, zhCN }

const zhCN = Locale('zh', 'CN');
const enUS = Locale('en', 'US');

final $locale = AppLocale();

class AppLocale {
  static const path = 'assets/locales';
  static const supportedLocales = [enUS, zhCN];
  AppLocaleSupported currentLocale = AppLocaleSupported.zhCN;
  Widget wrapApp(Widget appMain) {
    return EasyLocalization(
        supportedLocales: supportedLocales,
        path: path,
        fallbackLocale: supportedLocales[0],
        startLocale: supportedLocales[0],
        child: appMain);
  }

  void switchLocale(BuildContext context, AppLocaleSupported locale) {
    switch (locale) {
      case AppLocaleSupported.enUS:
        context.setLocale(enUS);
        break;
      case AppLocaleSupported.zhCN:
        context.setLocale(zhCN);
        break;
    }
    currentLocale = locale;
  }

  ///
  /// $locale.t('name')
  /// $locale.t('name', args: ['Dart'])
  /// $locale.t('name', namedArgs: {'lang': 'Dart'})
  String t(
    String name, {
    List<String>? args,
    Map<String, String>? namedArgs,
  }) =>
      name.tr(args: args, namedArgs: namedArgs);
}
