import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final appLogger = Logger(printer: PrettyPrinter(methodCount: 0));

Future<void> bootstrap() async {
  // 这里以后初始化 MMKV / Sentry / EMAS Push 等
  if (kDebugMode) {
    appLogger.i('Bootstrap done');
  }
}
