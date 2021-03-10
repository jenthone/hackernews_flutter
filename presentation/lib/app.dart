import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_router.gr.dart';
import 'config/color.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Workaround for auto-route when update to Flutter 2.0
      onGenerateRoute: (_) => null,
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
