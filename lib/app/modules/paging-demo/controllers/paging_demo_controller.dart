import 'package:get/get.dart';

import '../../../data/services/model/user_info_model.dart';
import '/app/core/base/controller/base_paging_controller.dart';

class PagingDemoController extends BasePagingController<UserInfoModel> {
  final refreshCount = 0.obs;

  @override
  void onInit() {
    showLoading();
    Future.delayed(Duration(seconds: 2), () {
      hideLoading();
    });
    super.onInit();
  }

  @override
  void fetchPage(int pageKey) {
    List<UserInfoModel> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(UserInfoModel(userId: i * pageKey, nickname: "$pageKey-$i"));
    }
    if (pageKey > 5 * 20) {
      getPagingController().appendLastPage(list);
    } else {
      getPagingController().appendPage(list, pageKey + list.length);
    }
  }

  @override
  bool refreshPage(bool isRefresh) {
    getPagingController().refresh();
    return true;
  }

  void incrementCount() => refreshCount.value++;
}
