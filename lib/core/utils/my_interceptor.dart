import 'package:dio/dio.dart';
import 'package:wncc_portal/core/utils/shared_preferences.dart';

class MyInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Content-Type'] = 'application/json';
    }
    return handler.next(options);
  }
}
