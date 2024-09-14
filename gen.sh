# resources
fluttergen -c pubspec.yaml
# locale
flutter pub run easy_localization:generate --source-dir assets/locales
flutter pub run easy_localization:generate --skip-unnecessary-keys --source-dir assets/locales  -f keys -o locale_keys.g.dart