import 'package:data/service/story_service.dart';
import 'package:domain/entity/story_type.dart';
import 'package:domain/repository/story_repository.dart';
import 'package:domain/result.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

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
