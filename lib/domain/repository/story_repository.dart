import '../entity/story_type.dart';

abstract class StoryRepository {
  Future<List<int>> fetchStories(StoryType type);
}
