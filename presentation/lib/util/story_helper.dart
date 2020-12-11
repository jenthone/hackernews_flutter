import 'package:domain/entity/story_type.dart';
import 'package:timeago/timeago.dart' as timeago;

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

  static String formatDate(int timeInSeconds) {
    final now = DateTime.now();
    final date = DateTime.fromMillisecondsSinceEpoch(timeInSeconds * 1000);
    final difference = now.difference(date);
    return timeago.format(now.subtract(difference));
  }
}
