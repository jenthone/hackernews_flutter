import 'package:domain/entity/item.dart';

import '../entity/item_response.dart';

extension ItemResponseMapper on ItemResponse {
  Item toDomain() {
    return Item(id, type, by, time, text, url, score, title, descendants);
  }
}
