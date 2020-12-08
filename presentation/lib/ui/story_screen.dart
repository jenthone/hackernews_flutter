import 'package:domain/entity/item.dart';
import 'package:domain/entity/story_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'story_view_model.dart';

class StoryScreen extends HookWidget {
  final StoryType _storyType;

  StoryScreen(this._storyType);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(storyViewModelProvider).fetchItems(_storyType);
      return null;
    }, []);
    final stories =
        useProvider(storyViewModelProvider.select((value) => value.stories));
    final items =
        useProvider(storyViewModelProvider.select((value) => value.items));
    return _buildContent(context, stories, items);
  }

  Widget _buildContent(
    BuildContext context,
    List<int> stories,
    Map<int, Item> items,
  ) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[stories[index]];
        final content =
            item == null ? _buildLoadingItem() : _buildContentItem(item);
        if (item == null) {
          context.read(storyViewModelProvider).fetchItem(stories[index]);
        }
        return Card(
          child: Container(
            child: SizedBox(
              child: content,
              height: 96,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildLoadingItem() {
    return Center(
      child: SpinKitThreeBounce(
        color: Colors.black38,
        size: 16,
      ),
    );
  }

  Widget _buildContentItem(Item item) {
    return Column(
      children: [
        Text(item.url),
        SizedBox(height: 10),
        Text(item.title),
      ],
    );
  }
}
