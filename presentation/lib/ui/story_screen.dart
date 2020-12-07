import 'package:domain/entity/story_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'story_view_model.dart';

class StoryScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(storyViewModelProvider).fetchItems(StoryType.newstories);
      return null;
    }, []);
    final stories =
        useProvider(storyViewModelProvider.select((value) => value.stories));
    return _buildContent(stories);
  }

  Widget _buildContent(
    List<int> stories,
  ) {
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (_, index) {
        return Container(
          child: SizedBox(
            child: Text('${stories[index]}'),
            height: 64,
          ),
        );
      },
    );
  }
}
