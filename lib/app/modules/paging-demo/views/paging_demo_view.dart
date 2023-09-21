import 'package:flutter/material.dart';
import '/app/core/styles/app_size.dart';
import '/app/data/services/model/user/user_info_model.dart';

import 'package:get/get.dart';
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

class PagingDemoView extends GetView<PagingDemoController> {
  const PagingDemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() =>
              Text('PagingDemoView ${controller.refreshCount.toString()}')),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(() {
            controller.refreshPage();
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
        ));
  }
}
