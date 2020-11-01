import 'package:get_it/get_it.dart';

import 'data/api.dart';
import 'data/repository/item_repository_impl.dart';
import 'data/service/item_service.dart';
import 'domain/repository/item_repository.dart';

final locator = GetIt.instance;

void configureDependencies() async {
  locator.registerSingleton(dio);

  locator.registerFactory(() => ItemService(locator.get()));

  locator.registerFactory<ItemRepository>(
    () => ItemRepositoryImpl(
      locator.get(),
    ),
  );
}
