import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatelessWidget {
  final Widget? child;
  final TransitionBuilder builder;

  const LoadingWidget({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return builder(context, child);
      },
    );
  }
}

class LoadingUtil {
  String loadingDefaultMessage;

  LoadingUtil(this.loadingDefaultMessage);

  init() => EasyLoading.init();

  void show(BuildContext context, {String? message}) {
    EasyLoading.show(status: message, maskType: EasyLoadingMaskType.black);
  }

  void showLoading(
    BuildContext context,
  ) {
    show(context, message: loadingDefaultMessage);
  }

  void showMessage(String msg) {
    EasyLoading.show(status: msg);
  }

  /// show progress with [value] [status], value should be 0.0 ~ 1.0.
  void showProgress(double value, {String? status}) {
    EasyLoading.showProgress(value, status: status);
  }

  void showSuccess(
    String status, {
    Duration? duration,
  }) {
    EasyLoading.showSuccess(status, duration: duration);
  }

  void showError(
    String status, {
    Duration? duration,
  }) {
    EasyLoading.showError(status, duration: duration);
  }

  void showInfo(
    String status, {
    Duration? duration,
  }) {
    EasyLoading.showInfo(status, duration: duration);
  }

  void showToast(
    String status, {
    Duration? duration,
  }) {
    EasyLoading.showToast(status, duration: duration);
  }

  void dismiss() {
    EasyLoading.dismiss();
  }
}
