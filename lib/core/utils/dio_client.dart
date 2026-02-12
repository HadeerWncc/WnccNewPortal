// dio_client.dart
import 'package:dio/dio.dart';

import 'my_interceptor.dart';

// Dio createDio() {
//   final dio = Dio(
//     BaseOptions(
//       // baseUrl: "http://wncc-portal.com:551/",
//       followRedirects: true, // لازم تكون true
//       maxRedirects: 5,
//       validateStatus: (status) => status! < 500,
//     ),
//   );

//   (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
//     final client = HttpClient();

//     // السطر ده بيخلي الأبلكيشن يستخدم بروكسي الجهاز (الـ VPN) بشكل صحيح
//     client.findProxy = (uri) {
//       return "DIRECT"; // جربي كلمة DIRECT الأول عشان يتخطى البروكسي
//     };

//     return client;
//   };

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
