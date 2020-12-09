import 'package:domain/entity/story_type.dart';

class StoryHelper {
  static String getDisplayTitle(StoryType storyType) {
    switch (storyType) {
      case StoryType.askstories:
        return 'ASK';
      case StoryType.topstories:
        return 'TOP';
      case StoryType.newstories:
        return 'NEW';
      case StoryType.beststories:
        return 'BEST';
      case StoryType.showstories:
        return 'SHOW';
      case StoryType.jobstories:
        return 'JOB';
      default:
        return '';
    }
  }
}
