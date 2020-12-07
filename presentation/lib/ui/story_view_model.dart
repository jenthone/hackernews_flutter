import 'package:data/injection.dart';
import 'package:domain/entity/story_type.dart';
import 'package:domain/usecase/get_item_use_case.dart';
import 'package:domain/usecase/get_stories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryViewModel extends ChangeNotifier {
  final GetItemUseCase _getItemUseCase;
  final GetStoriesUseCase _getStoriesUseCase;

  StoryViewModel(this._getItemUseCase, this._getStoriesUseCase);

  List<int> _stories = [];
  List<int> get stories => _stories;

  Future<void> fetchItems(StoryType storyType) async {
    final result = await _getStoriesUseCase.execute(storyType);
    result.when(
        success: (data) {
          _stories = data;
          notifyListeners();
        },
        error: (error) {});
  }

  Future<void> fetchItem(int id) async {
    await _getItemUseCase.execute(id);
  }
}

final storyViewModelProvider =
    ChangeNotifierProvider.autoDispose<StoryViewModel>((ref) => getIt());
