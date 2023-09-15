import '../styles/app_size.dart';
import '/app/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color rippleColor;
  late final double rippleRadius;

  Ripple(
      {Key? key,
      this.child,
      required this.onTap,
      this.rippleColor = AppColor.pageBackground,
      double? rippleRadius})
      : super(key: key) {
    this.rippleRadius = rippleRadius ?? AppSize.radiusSmall;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
