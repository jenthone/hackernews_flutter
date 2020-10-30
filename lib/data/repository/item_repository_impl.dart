import 'package:dio/dio.dart';

import '../../domain/entity/item.dart';
import '../../domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<Item> fetchItem(int id) async {}

  @override
  Future<Item> fetchOfflineItem(int id) {
    throw UnimplementedError();
  }
}
