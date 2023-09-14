import '/app/modules/main/model/menu_code.dart';

class BottomNavItem {
  final String navTitle;
  final String iconSvgPath;
  final MenuCode menuCode;

  const BottomNavItem(
      {required this.navTitle,
      required this.iconSvgPath,
      required this.menuCode});
}
