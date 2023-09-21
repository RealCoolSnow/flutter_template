import 'package:get/get.dart';

import '../controllers/paging_demo_controller.dart';

class PagingDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagingDemoController>(
      () => PagingDemoController(),
    );
  }
}
