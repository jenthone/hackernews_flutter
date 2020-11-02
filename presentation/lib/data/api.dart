import 'package:dio/dio.dart';

const _baseUrl = "https://hacker-news.firebaseio.com/v0/";

final _options = BaseOptions(
  baseUrl: _baseUrl,
);
final dio = Dio(_options);
