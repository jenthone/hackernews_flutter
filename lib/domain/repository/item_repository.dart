import '../entity/item.dart';

abstract class ItemRepository {
  Future<Item> fetchItem(int id);

  Future<Item> fetchOfflineItem(int id);
}
