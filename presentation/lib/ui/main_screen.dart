import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'story_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StoryScreen(),
      ),
    );
  }
}
