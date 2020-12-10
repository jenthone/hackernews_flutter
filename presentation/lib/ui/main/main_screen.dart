import 'package:domain/entity/story_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/story_helper.dart';
import '../story/story_screen.dart';
import 'main_view_model.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final storyType =
        useProvider(mainViewModelProvider.select((value) => value.storyType));
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton(
            value: context.read(mainViewModelProvider).storyType,
            style: TextStyle(color: Colors.white, fontSize: 16),
            iconDisabledColor: Colors.black,
            iconEnabledColor: Colors.white,
            underline: SizedBox(),
            dropdownColor: Colors.blue,
            items: StoryType.values.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(StoryHelper.getDisplayTitle(e)),
              );
            }).toList(),
            onChanged: (item) {
              context.read(mainViewModelProvider).storyType = item;
            }),
      ),
      body: StoryScreen(storyType),
    );
  }
}
