import 'package:auto_route/auto_route.dart';
import 'package:domain/entity/item.dart';
import 'package:domain/entity/story_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_router.gr.dart';
import '../../config/color.dart';
import '../../util/state_layout.dart';
import 'story_view_model.dart';

class StoryScreen extends HookWidget {
  final StoryType _storyType;

  StoryScreen(this._storyType);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(storyViewModelProvider).fetchItems(_storyType);
      return null;
    }, [_storyType]);
    final stories = useProvider(
      storyViewModelProvider.select((value) => value.stories),
    );
    final items = useProvider(
      storyViewModelProvider.select((value) => value.items),
    );
    final isLoading = useProvider(
      storyViewModelProvider.select((value) => value.isLoading),
    );

    final visibleStorySize = useProvider(
      storyViewModelProvider.select((value) => value.visibleStorySize),
    );

    return Statelayout(
      isLoading: isLoading,
      child: _buildContent(context, stories, items, visibleStorySize),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<int> stories,
    Map<int, Item> items,
    int currentSize,
  ) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          context.read(storyViewModelProvider).loadMoreStories();
        }
        return false;
      },
      child: ListView.builder(
        itemCount: currentSize,
        itemBuilder: (_, index) {
          final item = items[stories[index]];
          final content = item == null
              ? _buildLoadingItem()
              : _buildContentItem(context, item);
          if (item == null) {
            context.read(storyViewModelProvider).fetchItem(stories[index]);
          }
          return Card(
            child: content,
          );
        },
      ),
    );
  }

  Widget _buildLoadingItem() {
    return SizedBox(
      height: 96,
      child: Center(
        child: SpinKitThreeBounce(
          color: appColor,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildContentItem(BuildContext context, Item item) {
    return GestureDetector(
      onTap: () async {
        final url = item.url;
        if (url != null) {
          await context.navigator
              .push(Routes.webScreen, arguments: WebScreenArguments(url: url));
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            if (item.url != null) ...[
              SizedBox(height: 8),
              Text(
                item.url ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  item.by,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  item.time.toString(),
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
                Icon(
                  Icons.favorite,
                  color: appColor,
                ),
                SizedBox(width: 4),
                Text(
                  item.score.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.comment,
                  color: appColor,
                ),
                SizedBox(width: 4),
                Text(
                  item.descendants.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
