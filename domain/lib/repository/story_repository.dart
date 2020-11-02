import '../entity/story_type.dart';

mixin StoryRepository {
  Future<List<int>> fetchStories(StoryType type);
}
