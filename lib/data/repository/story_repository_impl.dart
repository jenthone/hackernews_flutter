import '../../domain/entity/story_type.dart';
import '../../domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  @override
  Future<List<int>> fetchStories(StoryType type) {
    throw UnimplementedError();
  }
}
