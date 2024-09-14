import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';

class DemoController extends BaseController {
  final count = 0.obs;

  void increment() => count.value++;
}
