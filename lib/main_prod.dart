import 'app/app.dart';
import '/flavors/build_config.dart';
import '/flavors/environment.dart';
import 'config/prod.dart';

void main() {

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  startApp();
}
