import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_locale.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: $locale.t("bottomNavSettings"),
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: $locale.t("settingsTheme"),
          prefixImage: Assets.images.icTheme.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: $locale.t("settingsLanguage"),
          prefixImage: Assets.images.icLanguage.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: _onLanguageItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: $locale.t("settingsFontSize"),
          prefixImage: Assets.images.icFontSize.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: _onFontSizeItemClicked,
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked() {
    showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked() {
    showToast('Language: Development in progress');
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

}
