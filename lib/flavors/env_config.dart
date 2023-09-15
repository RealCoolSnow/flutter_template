import 'package:logger/logger.dart';

import '../constants/app_values.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;
  final bool shouldPrintLog;
  late final Logger logger;

  EnvConfig(
      {required this.appName,
      required this.baseUrl,
      this.shouldCollectCrashLog = false,
      this.shouldPrintLog = true}) {
    logger = Logger(
      level: shouldPrintLog ? Level.all : Level.off,
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
