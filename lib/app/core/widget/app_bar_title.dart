import '/app/core/styles/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.pageTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
