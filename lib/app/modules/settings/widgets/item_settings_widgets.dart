import '/app/core/styles/app_textstyle.dart';
import 'package:flutter/material.dart';
import '../../../core/styles/app_size.dart';
import '../../../core/base/view/base_widget_mixin.dart';
import '../../../core/styles/app_color.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/ripple.dart';

class ItemSettings extends StatelessWidget with BaseWidgetMixin {
  final String prefixImage;
  final String suffixImage;
  final String title;
  final Function()? onTap;

  ItemSettings({
    required this.prefixImage,
    required this.suffixImage,
    required this.title,
    required this.onTap,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(AppSize.padding),
        child: Row(
          children: [
            AssetImageView(
              filePath: prefixImage,
              height: AppSize.iconSize_20,
              width: AppSize.iconSize_20,
            ),
            SizedBox(width: AppSize.paddingSmall),
            Text(title, style: AppTextStyle.base),
            const Spacer(),
            AssetImageView(
              filePath: suffixImage,
              color: AppColor.secondary,
              height: AppSize.iconSize_20,
              width: AppSize.iconSize_20,
            ),
          ],
        ),
      ),
    );
  }
}