import 'package:dio/dio.dart';

Dio configureDio() {
  final dio = Dio();
  dio.options.baseUrl = '';
  return dio;
}