import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrlExternal(BuildContext context, Uri url) async {
  if (await canLaunchUrl(url)) {
    return await launchUrl(url);
  } else {
    return Future(() => false);
  }
}
