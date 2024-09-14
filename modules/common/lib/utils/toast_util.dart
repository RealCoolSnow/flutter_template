import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// Toast util
///
class ToastUtil {
  static void show(String message, {Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength,
        timeInSecForIosWeb: 1,
        gravity: ToastGravity.BOTTOM,
        webBgColor: "#3c3c3c",
        webPosition: "center");
  }

  static void showWithNormalError(BuildContext context, dynamic err) {
    var msg = '';
    try {
      msg = err.msg;
    } catch (e) {
      msg = '';
    }
    if (msg.isEmpty) {
      if (err == null) {
        msg = 'error';
      } else {
        msg = err.toString();
      }
    }
    show(msg);
  }
}
