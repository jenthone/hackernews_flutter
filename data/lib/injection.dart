import 'package:data/api.dart';
import 'package:dio/dio.dart';
import 'package:domain/usecase/get_item_use_case.dart';
import 'package:domain/usecase/get_stories_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class DataModule {
  @lazySingleton
  Dio get dio => provideDio();

  @injectable
  GetItemUseCase get provideGetItemUseCase => GetItemUseCase(getIt());

  @injectable
  GetStoriesUseCase get provideGetStoriesUseCase => GetStoriesUseCase(getIt());
}

@InjectableInit(
  initializerName: r'$initData',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDataDependencies() => getIt.$initData();
