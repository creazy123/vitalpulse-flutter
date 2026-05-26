import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uuid/uuid.dart';

import '../../features/auth/auth_notifier.dart';
import '../../features/auth/auth_notifier_ext.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.vitalpulse.example.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    headers: {'Content-Type': 'application/json'},
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['X-Trace-Id'] = const Uuid().v4();
      final token = ref.read(authNotifierProvider).accessToken;
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
    onError: (e, handler) {
      if (e.response?.statusCode == 401) {
        ref.read(authNotifierProvider).logout();
      }
      handler.next(e);
    },
  ));

  if (kDebugMode) {
    dio.interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));
  }

  return dio;
});
