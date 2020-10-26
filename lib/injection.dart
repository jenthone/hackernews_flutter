import 'package:get_it/get_it.dart';
import 'data/repository/item_repository_impl.dart';
import 'domain/repository/item_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerFactory<ItemRepository>(() => ItemRepositoryImpl());
}
