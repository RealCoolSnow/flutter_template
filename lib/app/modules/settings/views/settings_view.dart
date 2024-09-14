import 'package:common/common_lib.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/app/core/app_locale.dart';

import '/app/common_import.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '../../../core/base/view/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: tr(LocaleKeys.settings_title),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: $locale.t(LocaleKeys.settings_theme),
          prefixImage: Assets.images.icTheme.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: $locale.t(LocaleKeys.settings_language),
          prefixImage: Assets.images.icLanguage.path,
          suffixImage: Assets.images.arrowForward.path,
          onTap: () {
            _onLanguageItemClicked(context);
          },
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: tr(LocaleKeys.settings_font_size),
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
    ToastUtil.show('Theme: Development in progress');
  }

  void _onLanguageItemClicked(BuildContext context) {
    // showToast('Language: Development in progress');
    controller.switchLocale(context);
  }

  void _onFontSizeItemClicked() {
    ToastUtil.show('Font Size: Development in progress');
  }
}
