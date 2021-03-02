import 'package:async/async.dart';

import '../entity/item.dart';

mixin ItemRepository {
  Future<Result<Item>> fetchItem(int id);
}
