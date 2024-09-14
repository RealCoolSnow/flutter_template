// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/core/styles/app_color.dart';
import 'package:flutter_template/app/core/widget/app_bar_title.dart';
import 'package:flutter_template/app/modules/webview/controllers/webview_controller.dart';
import 'package:flutter_template/flavors/build_config.dart';

import '/app/common_import.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '../channel/flutter_channel.dart'
    if (dart.library.io) '../channel/flutter_channel.dart'
    if (dart.library.html) '../channel/flutter_channel_web.dart';

// ignore: must_be_immutable
class WebViewView extends BaseView<WebViewController> {
  final GlobalKey webViewKey = GlobalKey();
  FlutterChannel flutterChannel = FlutterChannel();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      onPop: () => controller.onBack(),
      appBarTitleText: controller.title.value,
      appBarTitle: Obx(() => AppBarTitle(text: controller.title.value)),
    );
  }

  @override
  Widget body(BuildContext context) {
    return /*PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) return;
        controller.onBack();
      },
      child: */
        RefreshIndicator(
            onRefresh: () async {
              await controller.webViewController?.reload();
            },
            child: Stack(
              children: [
                _buildInAppWebView(context),
                Obx(() => controller.loadProgress.value < 100
                    ? Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(
                          value: controller.loadProgress.value / 100.0,
                          backgroundColor: Colors.transparent,
                          minHeight: 2,
                          color: AppColor.green,
                        ),
                      )
                    : const SizedBox.shrink()),
              ],
            ) /*),*/
            );
  }

  Widget _buildInAppWebView(context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: WebUri(controller.url.value)),
      initialSettings: InAppWebViewSettings(
        // isInspectable: true,
        // allowFileAccessFromFileURLs: true,
        // allowUniversalAccessFromFileURLs: true,
        // useOnLoadResource: true,
        // preferredContentMode: UserPreferredContentMode.MOBILE,
        // useShouldOverrideUrlLoading: true,
        cacheMode: CacheMode.LOAD_NO_CACHE,
        applicationNameForUserAgent: BuildConfig.instance.config.appName,
        // useHybridComposition: false
        // iframeSandbox: Set<Sandbox>.from(Sandbox.ALLOW_ALL)
      ),
      onReceivedServerTrustAuthRequest:
          (webViewController, authenticationChallenge) async {
        return ServerTrustAuthResponse(
            action: ServerTrustAuthResponseAction.PROCEED);
      },
      shouldOverrideUrlLoading: (controller, action) async {
        return NavigationActionPolicy.ALLOW;
      },
      onWebContentProcessDidTerminate: (controller) {
        controller.reload();
      },
      onWebViewCreated: (_controller) {
        controller.webViewController = _controller;
        flutterChannel.init(context, _controller, (message, data) {
          $logger.d('FlutterChannel onMessage:$message $data');
        });
        // }
      },
      onProgressChanged: (_controller, progress) {
        controller.loadProgress.value = progress;
        $logger.d('onProgressChanged: $progress');
      },
      onTitleChanged: (_controller, _title) {
        $logger.d('onTitleChanged: $_title');
        if (controller.title.value.isEmpty) {
          controller.title.value = _title ?? '';
        }
      },
      // onLoadStop: (controller, url) {},
      // onConsoleMessage: (controller, consoleMessage) {
      //   // logUtil.d('onConsoleMessage: ${consoleMessage.message}');
      //   // ToastUtil.show(context, "onConsoleMessage");
      // },
    );
  }
}
