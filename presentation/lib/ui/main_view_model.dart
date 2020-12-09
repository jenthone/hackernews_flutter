import 'package:data/injection.dart';
import 'package:domain/entity/story_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainViewModel extends ChangeNotifier {
  StoryType _storyType = StoryType.newstories;

  StoryType get storyType => _storyType;

  set storyType(StoryType storyType) {
    _storyType = storyType;
    notifyListeners();
  }
}

final mainViewModelProvider =
    ChangeNotifierProvider.autoDispose<MainViewModel>((ref) => getIt());
