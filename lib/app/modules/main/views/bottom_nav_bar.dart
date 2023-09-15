import '/app/core/styles/app_size.dart';
import '/app/common_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/styles/app_color.dart';
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
                    height: AppSize.iconDefaultSize,
                    width: AppSize.iconDefaultSize,
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
        backgroundColor: AppColor.primary,
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
        navTitle: tr(LocaleKeys.home),
        iconSvgPath: Assets.images.tabIcons.icHome.path,
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: tr(LocaleKeys.favorite),
          iconSvgPath: Assets.images.tabIcons.icFavorite.path,
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: tr(LocaleKeys.settings),
          iconSvgPath: Assets.images.tabIcons.icSettings.path,
          menuCode: MenuCode.SETTINGS)
    ];
  }
}
