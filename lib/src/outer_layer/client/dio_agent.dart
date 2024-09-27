import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio configureDio() {
  final dio = Dio();
  dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      return handler.next(options);
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) {
      if(response.realUri.toString().contains('Todo')){
        SharedPreferences.getInstance().then((s) {
          s.setString('_data', jsonEncode(response.data.toString()));
        });
      }

      print(response);
      return handler.next(response);
    },
    onError: (DioException error, ErrorInterceptorHandler handler) {
      return handler.next(error);
    },
  ),
);
  dio.options.baseUrl = 'https://64bfc2a60d8e251fd111630f.mockapi.io';
  return dio;
}