import 'dart:math';

import 'package:data/injection.dart';
import 'package:domain/entity/item.dart';
import 'package:domain/entity/story_type.dart';
import 'package:domain/logger.dart';
import 'package:domain/usecase/get_item_use_case.dart';
import 'package:domain/usecase/get_stories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryViewModel extends ChangeNotifier {
  static const pageSize = 10;

  final GetItemUseCase _getItemUseCase;
  final GetStoriesUseCase _getStoriesUseCase;

  StoryViewModel(this._getItemUseCase, this._getStoriesUseCase);

  List<int> _stories = [];
  List<int> get stories => _stories;

  Map<int, Item> _items = {};
  Map<int, Item> get items => _items;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int _visibleStorySize = pageSize;

  int get visibleStorySize => min(_visibleStorySize, _stories.length);

  Future<void> fetchItems(StoryType storyType) async {
    _isLoading = true;
    _visibleStorySize = pageSize;
    notifyListeners();

    final result = await _getStoriesUseCase.execute(storyType);
    result.when(
      success: (data) {
        _stories = data.toList();
        _isLoading = false;
        notifyListeners();
      },
      error: (error) {
        logger.e(error);
      },
    );
  }

  Future<void> fetchItem(int id) async {
    final result = await _getItemUseCase.execute(id);
    result.when(
      success: (data) {
        _items = Map.from(_items);
        _items[id] = data;
        notifyListeners();
      },
      error: (error) {
        logger.e(error);
      },
    );
  }

  void loadMoreStories() {
    final nextVisibleStorySize = _visibleStorySize + pageSize;
    _visibleStorySize = min(nextVisibleStorySize, _stories.length);
    notifyListeners();
  }
}

final storyViewModelProvider =
    ChangeNotifierProvider.autoDispose<StoryViewModel>((ref) => getIt());
