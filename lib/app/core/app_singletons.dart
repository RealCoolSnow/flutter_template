import 'package:common/utils/loading_util.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/core/app_locale.dart';
import 'package:flutter_template/app/core/logic/user_logic.dart';
import 'package:flutter_template/app/data/services/api/api_v1.dart';

import '/app/data/local/preference/preference_manager.dart';
import '/app/data/local/preference/preference_manager_impl.dart';

void registerSingletons() {
  Get.put<PreferenceManager>(
    PreferenceManagerImpl(),
    tag: (PreferenceManager).toString(),
  );
  Get.put<ApiV1>(
    ApiV1(),
    tag: (ApiV1).toString(),
    permanent: true,
  );
  Get.lazyPut<LoadingUtil>(
    () => LoadingUtil($locale.t('loading')),
    tag: (LoadingUtil).toString(),
    permanent: true,
  );
  Get.put<UserLogic>(
    UserLogic(),
    tag: (UserLogic).toString(),
    permanent: true,
  );
}

PreferenceManager get preferenceManager =>
    Get.find(tag: (PreferenceManager).toString());

ApiV1 get apiV1 => Get.find(tag: (ApiV1).toString());

LoadingUtil get loadingUtil => Get.find(tag: (LoadingUtil).toString());

UserLogic get userLogic => Get.find(tag: (UserLogic).toString());
