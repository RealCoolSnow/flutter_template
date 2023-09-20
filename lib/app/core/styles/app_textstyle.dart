import '/app/core/styles/app_font.dart';

import '/app/core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppTextStyle {
  // 10
  static TextStyle xs = copy(sizePx: 10.sp);
  static TextStyle xsBold = sm.copyWith(fontWeight: FontWeight.w800);
  // 12
  static TextStyle sm = copy(sizePx: 12.sp);
  static TextStyle smBold = sm.copyWith(fontWeight: FontWeight.w800);
  // 14
  static TextStyle base = copy(sizePx: 14.sp);

  static TextStyle baseBold = base.copyWith(fontWeight: FontWeight.w800);
  // 16
  static TextStyle lg = copy(sizePx: 16.sp);
  static TextStyle lgBold = lg.copyWith(fontWeight: FontWeight.w800);
  // 18
  static TextStyle xl = copy(sizePx: 18.sp);
  static TextStyle xlBold = xl.copyWith(fontWeight: FontWeight.w800);
  // 20
  static TextStyle xl2 = copy(sizePx: 20.sp);

  static TextStyle xl2Bold = xl2.copyWith(fontWeight: FontWeight.w800);
  //26
  static TextStyle xl5 = copy(sizePx: 26.sp);
  static TextStyle xl5Bold = xl5.copyWith(fontWeight: FontWeight.w800);
  // 28
  static TextStyle xl6 = copy(sizePx: 28.sp);
  static TextStyle xl6Bold = xl6.copyWith(fontWeight: FontWeight.w800);
  // 36
  static TextStyle xl9 = copy(sizePx: 36.sp);
  static TextStyle xl9Bold = xl9.copyWith(fontWeight: FontWeight.w800);

  static TextStyle copy(
      {required double sizePx, FontWeight weight = FontWeight.w400}) {
    return TextStyle(
      fontSize: sizePx,
      fontWeight: weight,
    );
  }

  //----------------------------------------------------------------
  //页面标题
  static TextStyle pageTitleStyle = TextStyle(
      fontSize: AppFont.base,
      fontWeight: FontWeight.w600,
      color: AppColor.white);
}
