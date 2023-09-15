import 'dart:async';

import '/app/core/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/app/bindings/initial_binding.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'core/app_locale.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  Widget wrapScreenUtil(Widget childApp) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return childApp;
        });
  }

  @override
  Widget build(BuildContext context) {
    return wrapScreenUtil(GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.main(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

class AppEntry {
  void runWithCatchError(Widget appMain) {
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (BuildConfig.instance.isProd) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };
    // runZonedGuarded<Future<Null>>(() async {
    runApp($locale.wrapApp(appMain));
    // }, (error, stackTrace) async {
    //   _reportError(error, stackTrace);
    // });
  }

  Future<void> _reportError(dynamic error, dynamic stackTrace) async {
    if (!BuildConfig.instance.isProd) {
      $logger.e(stackTrace);
    }
    //then, report to your server
  }
}

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => AppEntry().runWithCatchError(const App()));
}
