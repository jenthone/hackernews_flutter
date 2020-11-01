import '../../domain/entity/item.dart';
import '../../domain/repository/item_repository.dart';
import '../mapper/data_mapper.dart';
import '../service/item_service.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemService _itemService;

  ItemRepositoryImpl(this._itemService);

  @override
  Future<Item> fetchItem(int id) async {
    final response = await _itemService.fetchItem(id);
    return response.toDomain();
  }

  @override
  Future<Item> fetchOfflineItem(int id) {
    throw UnimplementedError();
  }
}
