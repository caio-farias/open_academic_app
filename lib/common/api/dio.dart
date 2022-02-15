// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:open_academic_app/common/stores/user_store/user.store.dart';
import 'package:open_academic_app/env.dart';

class CustomDio {
  Dio? _dio;
  final int timeout = 10000;

  CustomDio() {
    _dio = Dio(BaseOptions(baseUrl: baseURL, connectTimeout: timeout, headers: {
      "Content-Type": "application/json;charset=utf-8",
    }));

    _dio!.interceptors.add(CustomInterceptors());
  }

  CustomDio.WithAuthorization() {
    _dio = Dio(BaseOptions(baseUrl: baseURL, connectTimeout: timeout, headers: {
      "Content-Type": "application/json;charset=utf-8",
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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final _userStore = GetIt.I.get<UserStore>();
    String accessToken = _userStore.getAccessToken;
    options.headers['Authorization'] = 'Bearer $accessToken';
    print('REQUEST[${options.method}] => PATH: ${options.uri}');
    return super.onRequest(options, handler);
  }
}
