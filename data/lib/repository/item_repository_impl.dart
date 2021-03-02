import 'package:async/async.dart';
import 'package:domain/entity/item.dart';
import 'package:domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

import '../mapper/data_mapper.dart';
import '../service/item_service.dart';

@Injectable(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemService _itemService;

  ItemRepositoryImpl(this._itemService);

  @override
  Future<Result<Item>> fetchItem(int id) {
    final responseFuture =
        _itemService.fetchItem(id).then((value) => value.toDomain());
    return Result.capture(responseFuture);
  }
}
