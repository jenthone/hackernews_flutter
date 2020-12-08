import 'package:domain/entity/story_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'story_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabBars = StoryType.values.map(
      (e) => Tab(text: _getDisplayTitle(e)),
    );
    final tabViews = StoryType.values.map(
      (e) => StoryScreen(e),
    );
    return DefaultTabController(
        length: StoryType.values.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hacker News'),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: tabBars.toList(),
            ),
          ),
          body: TabBarView(
            children: tabViews.toList(),
          ),
        ));
  }

  String _getDisplayTitle(StoryType storyType) {
    switch (storyType) {
      case StoryType.askstories:
        return 'ASK';
      case StoryType.topstories:
        return 'TOP';
      case StoryType.newstories:
        return 'NEW';
      case StoryType.beststories:
        return 'BEST';
      case StoryType.showstories:
        return 'SHOW';
      case StoryType.jobstories:
        return 'JOB';
      default:
        return '';
    }
  }
}
