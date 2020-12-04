import 'package:auto_route/auto_route_annotations.dart';

import 'ui/main_screen.dart';
import 'ui/welcome_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: WelcomeScreen, initial: true),
    MaterialRoute(page: MainScreen),
  ],
)
class $AppRouter {}
