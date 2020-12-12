import '../entity/item.dart';
import '../result.dart';

mixin ItemRepository {
  Future<Result<Item>> fetchItem(int id);
}
