import 'package:domain/entity/story_type.dart';

class StoryHelper {
  static String getDisplayTitle(StoryType storyType) {
    switch (storyType) {
      case StoryType.askstories:
        return 'Ask Stories';
      case StoryType.topstories:
        return 'Top Stories';
      case StoryType.newstories:
        return 'New Stories';
      case StoryType.beststories:
        return 'Best Stories';
      case StoryType.showstories:
        return 'Show Stories';
      case StoryType.jobstories:
        return 'Job Stories';
      default:
        return '';
    }
  }
}
