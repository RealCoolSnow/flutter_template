import 'package:get/get.dart';

import '/app/data/services/model/user/user_info_model.dart';
import '/app/core/base/controller/base_paging_controller.dart';

class PagingDemoController extends BasePagingController<UserInfoModel> {
  final refreshCount = 0.obs;
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
  void refreshPage() {
    getPagingController().refresh();
  }

  void incrementCount() => refreshCount.value++;
}
