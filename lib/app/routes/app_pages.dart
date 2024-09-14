import 'package:flutter_template/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_template/app/modules/splash/views/splash_view.dart';
import 'package:flutter_template/app/modules/user/login/bindings/login_binding.dart';
import 'package:flutter_template/app/modules/user/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/webview/bindings/webview_binding.dart';
import 'package:flutter_template/app/modules/webview/views/webview_view.dart';

import '/app/modules/paging-demo/bindings/paging_demo_binding.dart';
import '/app/modules/paging-demo/views/paging_demo_view.dart';
import '/app/modules/favorite/bindings/favorite_binding.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PAGING_DEMO,
      page: () => PagingDemoView(),
      binding: PagingDemoBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => WebViewView(),
      binding: WebViewBinding(),
    ),
  ];
}
