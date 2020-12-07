import '../entity/story_type.dart';
import '../result.dart';

mixin StoryRepository {
  Future<Result<List<int>>> fetchStories(StoryType type);
}
