import 'package:common/utils/device_util.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/common_import.dart';

import '../../../core/base/controller/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  void onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }

  @override
  void onInit() {
    DeviceUtil.init(
        isInWechat: WebUtil.isInWechat(), webUserAgent: getUserAgent());
    super.onInit();
  }
}
