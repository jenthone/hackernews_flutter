import 'package:data/injection.dart';

import 'ui/story_view_model.dart';

void configurePresentationDependencies() {
  getIt.registerFactory(() => StoryViewModel(getIt(), getIt()));
}
