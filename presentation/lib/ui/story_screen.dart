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
      itemCount: stories.length,
      itemBuilder: (_, index) {
        final item = items[stories[index]];
        final content =
            item == null ? _buildLoadingItem() : _buildContentItem(item);
        if (item == null) {
          context.read(storyViewModelProvider).fetchItem(stories[index]);
        }
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: content,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildLoadingItem() {
    return SizedBox(
      height: 96,
      child: Center(
        child: SpinKitThreeBounce(
          color: Colors.black38,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildContentItem(Item item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.url ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Text(
          item.title ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              item.by ?? '',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              item.time.toString() ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.favorite),
            Text(
              item.score.toString() ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 16),
            Icon(Icons.comment),
            Text(
              item.descendants.toString() ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
