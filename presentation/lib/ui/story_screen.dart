import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StoryScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Main',
        style: TextStyle(fontSize: 28, color: Colors.amber),
      ),
    );
  }
}
