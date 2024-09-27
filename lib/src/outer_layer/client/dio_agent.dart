import 'package:dio/dio.dart';

Dio configureDio() {
  final dio = Dio();
  dio.options.baseUrl = 'https://64bfc2a60d8e251fd111630f.mockapi.io';
  return dio;
}