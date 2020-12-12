import 'package:domain/entity/item.dart';
import 'package:domain/repository/item_repository.dart';
import 'package:domain/result.dart';

class GetItemUseCase {
  final ItemRepository _itemRepository;

  GetItemUseCase(this._itemRepository);

  Future<Result<Item>> execute(int id) => _itemRepository.fetchItem(id);
}
