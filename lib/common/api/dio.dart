// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:open_academic_app/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio {
  Dio? _dio;
  final int timeout = 10000;

  CustomDio() {
    _dio = Dio(BaseOptions(baseUrl: baseURL, connectTimeout: timeout, headers: {
      "Content-Type": "application/json;charset=UTF-8",
    }));

    _dio!.interceptors.add(CustomInterceptors());
  }

  CustomDio.WithAuthorization() {
    _dio = Dio(BaseOptions(baseUrl: baseURL, connectTimeout: timeout, headers: {
      "Content-Type": "application/json;charset=UTF-8",
    }));

    _dio!.interceptors.add(CustomInterceptorsWithAuth());
  }

  Dio get instance => _dio!;
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}

class CustomInterceptorsWithAuth extends CustomInterceptors {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';
    print(options.headers['Authorization']);
    print('REQUEST[${options.method}] => PATH: ${options.uri}');
    return super.onRequest(options, handler);
  }
}
