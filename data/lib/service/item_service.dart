import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/item_response.dart';

part 'item_service.g.dart';

@injectable
@RestApi()
abstract class ItemService {
  @factoryMethod
  factory ItemService(Dio dio) = _ItemService;

  @GET('item/{id}.json')
  Future<ItemResponse> fetchItem(@Path('id') int id);
}
