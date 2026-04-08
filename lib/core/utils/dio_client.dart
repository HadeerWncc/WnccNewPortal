// dio_client.dart
import 'package:dio/dio.dart';

import 'my_interceptor.dart';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      followRedirects: true,
      maxRedirects: 5,
      validateStatus: (status) => status! < 500,
    ),
  );

  dio.interceptors.add(MyInterceptor());
  dio.interceptors.add(LogInterceptor(responseHeader: true));

  return dio;
}
