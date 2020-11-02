import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/item_response.dart';

part 'item_service.g.dart';

@RestApi()
abstract class ItemService {
  factory ItemService(Dio dio, {String baseUrl}) = _ItemService;

  @GET("item/{id}.json")
  Future<ItemResponse> fetchItem(@Path("id") int id);
}
