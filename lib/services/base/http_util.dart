import '/flavors/build_config.dart';
import 'package:dio/dio.dart';
import 'network/dio_provider.dart';
import 'network/error_handlers.dart';
import 'network/exceptions/base_exception.dart';

class HttpMethod {
  static const String GET = "get";
  static const String POST = "post";
  static const String PUT = "put";
  static const String DELETE = "delete";
  static const String UPLOAD = "upload";
}

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio _dio;
  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    _dio = DioProvider.dioWithHeaderToken;
  }

  // /// get
  // Future<dynamic> get(String path, {Map<String, String>? getParams}) {
  //   return request(path, HttpMethod.GET, getParams: getParams);
  // }

  // /// post
  // Future<dynamic> post(String path, postData) {
  //   return request(path, HttpMethod.POST, postData: postData);
  // }

  // /// put
  // Future<dynamic> put(String path, postData) {
  //   return request(path, HttpMethod.PUT, postData: postData);
  // }

  // /// delete
  // Future<dynamic> delete(String path, postData) {
  //   return request(path, HttpMethod.DELETE, postData: postData);
  // }

  // /// upload
  // Future<dynamic> upload(String path, postData) {
  //   return request(path, HttpMethod.UPLOAD, postData: postData);
  // }

  Future<dynamic> request(String path, String method,
      {postData, Map<String, String>? getParams}) async {
    try {
      Response response = await _dio.request(path,
          queryParameters: getParams,
          data: postData,
          options: Options(method: method));
      dynamic data;
      try {
        data = response.data;
      } catch (e) {
        data = null;
      }
      return data;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      $logger.e(
          "Dio throwing error: $exception : ${(exception as BaseException).message}");

      return Future.error(dioError);
    } catch (error) {
      $logger.e("Dio generic error: $error");

      return Future.error(error);
    }
  }
}
