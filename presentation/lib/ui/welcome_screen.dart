import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../app_router.gr.dart';
import '../config/color.dart';

class WelcomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.navigator.replace(Routes.mainScreen);
      return null;
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: appColor,
          child: Center(
            child: Text(
              'Hacker News',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
