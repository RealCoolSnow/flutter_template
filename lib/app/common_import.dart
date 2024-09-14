export 'package:flutter/material.dart';
export '/generated/locale_keys.g.dart';
export '/generated/assets.gen.dart';
export 'package:flutter_template/app/core/app_singletons.dart';
export 'package:flutter_template/web/web_util.dart'
    if (dart.library.io) 'package:flutter_template/web/app_impl/web_util.dart'
    if (dart.library.html) 'package:flutter_template/web/web_util.dart';
