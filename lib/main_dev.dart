import 'app/app.dart';
import '/flavors/build_config.dart';
import '/flavors/environment.dart';
import 'config/dev.dart';

void main() {
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  startApp();
}
