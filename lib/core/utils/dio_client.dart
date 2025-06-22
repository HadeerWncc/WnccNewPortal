// dio_client.dart
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io';

import 'my_interceptor.dart';

Dio createDio() {
  final Dio dio = Dio()..interceptors.add(MyInterceptor());

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );

  return dio;
}
