import '../entity/item.dart';

mixin ItemRepository {
  Future<Item> fetchItem(int id);

  Future<Item> fetchOfflineItem(int id);
}
