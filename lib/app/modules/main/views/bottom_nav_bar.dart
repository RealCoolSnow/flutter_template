import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/app/app_locale.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:get/get.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/model/menu_item.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  BottomNavBar({Key? key, required this.onNewMenuSelected}) : super(key: key);

  final navController = BottomNavController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    Color selectedItemColor = Colors.white;
    Color unselectedItemColor = Colors.grey;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navItem.iconSvgPath,
                    height: AppValues.iconDefaultSize,
                    width: AppValues.iconDefaultSize,
                    color:
                        navItems.indexOf(navItem) == navController.selectedIndex
                            ? selectedItemColor
                            : unselectedItemColor,
                  ),
                  label: navItem.navTitle,
                  tooltip: ""),
            )
            .toList(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.colorAccent,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: $locale.t("bottomNavHome"),
        iconSvgPath: Assets.images.tabIcons.icHome.path,
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: $locale.t("bottomNavFavorite"),
          iconSvgPath: Assets.images.tabIcons.icFavorite.path,
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: $locale.t("bottomNavSettings"),
          iconSvgPath: Assets.images.tabIcons.icSettings.path,
          menuCode: MenuCode.SETTINGS)
    ];
  }
}
