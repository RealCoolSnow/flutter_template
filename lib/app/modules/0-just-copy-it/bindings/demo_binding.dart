import 'package:get/get.dart';
import 'package:flutter_template/app/modules/0-just-copy-it/controllers/demo_controller.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(
      () => DemoController(),
    );
  }
}
