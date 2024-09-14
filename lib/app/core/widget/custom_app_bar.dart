import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_color.dart';
import '/app/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final Widget? appBarTitle;
  final VoidCallback? onPop;
  const CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.appBarTitle,
    this.onPop,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return AppBar(
      backgroundColor: AppColor.primary,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onPop ?? () => Get.back(),
            )
          : null,
      actions: actions,
      iconTheme: const IconThemeData(color: Colors.white),
      title: appBarTitle ?? AppBarTitle(text: appBarTitleText),
    );
  }
}
