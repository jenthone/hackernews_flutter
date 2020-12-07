import 'package:domain/entity/item.dart';
import 'package:domain/repository/item_repository.dart';
import 'package:domain/result.dart';
import 'package:injectable/injectable.dart';
import '../mapper/data_mapper.dart';
import '../service/item_service.dart';

@Injectable(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemService _itemService;

  ItemRepositoryImpl(this._itemService);

  @override
  Future<Result<Item>> fetchItem(int id) {
    return runCatchingAsync(() async {
      final response = await _itemService.fetchItem(id);
      return response.toDomain();
    });
  }

  @override
  Future<Result<Item>> fetchOfflineItem(int id) {
    throw UnimplementedError();
  }
}
