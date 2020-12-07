import 'package:domain/entity/story_type.dart';
import 'package:domain/repository/story_repository.dart';
import 'package:domain/result.dart';

class GetStoriesUseCase {
  final StoryRepository _storyRepository;

  GetStoriesUseCase(this._storyRepository);

  Future<Result<List<int>>> execute(StoryType storyType) {
    return _storyRepository.fetchStories(storyType);
  }
}
