import 'package:domain/entity/story_type.dart';
import 'package:domain/repository/story_repository.dart';
import 'package:domain/result.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../service/story_service.dart';

@Injectable(as: StoryRepository)
class StoryRepositoryImpl implements StoryRepository {
  final StoryService _storyService;

  StoryRepositoryImpl(this._storyService);

  @override
  Future<Result<List<int>>> fetchStories(StoryType type) {
    return runCatchingAsync(() async {
      return await _storyService.fetchStories(describeEnum(type));
    });
  }
}
