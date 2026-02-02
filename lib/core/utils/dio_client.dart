// dio_client.dart
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:wncc_portal/core/constants/links.dart';
import 'dart:io';

import 'my_interceptor.dart';

// Dio createDio() {
//   final Dio dio = Dio(
//     BaseOptions(
//       // baseUrl: baseUrl,
//       followRedirects: true,
//       maxRedirects: 5,
//       validateStatus: (status) => status! < 500,
//     ),
//   )..interceptors.add(MyInterceptor());

//   dio.httpClientAdapter = IOHttpClientAdapter(
//     createHttpClient: () {
//       final client = HttpClient()
//         ..badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//       return client;
//     },
//   );

//   return dio;
// }

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
