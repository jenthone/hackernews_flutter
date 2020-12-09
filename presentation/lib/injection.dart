import 'package:data/injection.dart';

import 'ui/main_view_model.dart';
import 'ui/story_view_model.dart';

void configurePresentationDependencies() {
  getIt.registerFactory(() => StoryViewModel(getIt(), getIt()));
  getIt.registerFactory(() => MainViewModel());
}
