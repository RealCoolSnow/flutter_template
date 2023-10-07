import 'package:get/get.dart';

import '/app/data/local/preference/preference_manager.dart';
import '/app/data/local/preference/preference_manager_impl.dart';

void registerSingletons() {
  Get.lazyPut<PreferenceManager>(
    () => PreferenceManagerImpl(),
    tag: (PreferenceManager).toString(),
    fenix: true,
  );
}

PreferenceManager get preferenceManager =>
    Get.find(tag: (PreferenceManager).toString());
