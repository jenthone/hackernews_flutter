import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'app_router.gr.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        initialRoute: '/',
        builder: (ctx, extendedNav) => Theme(
          data: ThemeData.light(),
          child: extendedNav,
        ),
      ),
    );
  }
}
