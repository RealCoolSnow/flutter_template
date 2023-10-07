import 'package:common/utils/toast.dart';

import '/app/common_import.dart';
import 'package:flutter/material.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: tr(LocaleKeys.settings),
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: tr(LocaleKeys.theme),
          prefixImage: Assets.images.icTheme.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: tr(LocaleKeys.language),
          prefixImage: Assets.images.icLanguage.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: () {
            _onLanguageItemClicked(context);
          },
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: tr(LocaleKeys.font_size),
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

  void _onLanguageItemClicked(BuildContext context) {
    // showToast('Language: Development in progress');
    controller.switchLocale(context);
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }

}
