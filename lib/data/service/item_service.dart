import 'package:dio/dio.dart';

import '../entity/item_response.dart';

class ItemService {
  final Dio _dio;

  ItemService(this._dio);

  Future<ItemResponse> fetchItem(int id) async {
    final response = await _dio.get("/item/$id.json");
  }
}
