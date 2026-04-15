import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/shell/clawline_shell.dart';
import 'bootstrap.dart';

class ClawlineApp extends StatelessWidget {
  const ClawlineApp({super.key, required this.services});

  final ClawlineServices services;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClawLine Alpha',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(),
      home: ClawlineShell(services: services),
    );
  }
}
