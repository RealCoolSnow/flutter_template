import '/app/core/styles/app_color.dart';
import '/app/core/styles/app_size.dart';

import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color bgColor;
  late final double borderRadius;

  ElevatedContainer({
    Key? key,
    required this.child,
    this.bgColor = AppColor.primary,
    this.padding,
    double? borderRadius,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? AppSize.radiusSmall;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: AppColor.greyOpacity,
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColor.pageBackground),
      child: child,
    );
  }
}
