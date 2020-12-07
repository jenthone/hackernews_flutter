import 'package:dio/dio.dart';

Dio provideDio() {
  const baseUrl = 'https://hacker-news.firebaseio.com/v0/';
  final options = BaseOptions(baseUrl: baseUrl);
  return Dio(options);
}
