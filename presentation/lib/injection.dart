import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void configureDependencies() async {
  // locator.registerSingleton(dio);

  // locator.registerFactory(() => ItemService(locator.get()));

  // locator.registerFactory<ItemRepository>(
  //   () => ItemRepositoryImpl(
  //     locator.get(),
  //   ),
  // );
}
