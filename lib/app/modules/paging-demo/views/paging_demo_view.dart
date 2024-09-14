import 'package:flutter/material.dart';
import 'package:flutter_template/app/core/base/view/base_skeleton_view.dart';
import 'package:flutter_template/app/core/widget/custom_app_bar.dart';
import '/app/core/styles/app_size.dart';
import '../../../data/services/model/user_info_model.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controllers/paging_demo_controller.dart';

class PageItem extends StatelessWidget {
  final String title;
  const PageItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.padding),
      child: Text(title),
    );
  }
}

class PagingDemoView extends BaseSkeletonView<PagingDemoController> {
  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() {
        controller.refreshPage(true);
        controller.incrementCount();
      }),
      child: PagedListView<int, UserInfoModel>(
        pagingController: controller.getPagingController(),
        builderDelegate: PagedChildBuilderDelegate<UserInfoModel>(
          itemBuilder: (context, item, index) => PageItem(
            title: item.nickname,
          ),
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'PagingDemoView ${controller.refreshCount.toString()}',
    );
  }
}
