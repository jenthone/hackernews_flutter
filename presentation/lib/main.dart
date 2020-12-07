import 'package:data/injection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'injection.dart';

void main() {
  configureDataDependencies();
  configurePresentationDependencies();
  runApp(ProviderScope(child: App()));
}
