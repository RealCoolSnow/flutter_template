import 'package:dio/dio.dart';
import 'package:flutter_template/app/core/app_singletons.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {'content-type': 'application/json'};
    final token = await userLogic.getToken();
    if (token.isNotEmpty) {
      customHeaders['Authorization'] = token; //'Bearer $token';
    }
    return customHeaders;
  }
}
