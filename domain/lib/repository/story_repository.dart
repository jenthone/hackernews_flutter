import 'package:async/async.dart';

import '../entity/story_type.dart';

mixin StoryRepository {
  Future<Result<List<int>>> fetchStories(StoryType type);
}
