import 'package:flutter/material.dart';

import '../../app/bootstrap.dart';
import '../activity/activity_screen.dart';
import '../chats/chats_screen.dart';
import '../console/console_screen.dart';
import '../settings/settings_screen.dart';

class ClawlineShell extends StatefulWidget {
  const ClawlineShell({super.key, required this.services});

  final ClawlineServices services;

  @override
  State<ClawlineShell> createState() => _ClawlineShellState();
}

class _ClawlineShellState extends State<ClawlineShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      ChatsScreen(
        connectionService: widget.services.connectionService,
        sessionService: widget.services.sessionService,
      ),
      ActivityScreen(
        connectionService: widget.services.connectionService,
        sessionService: widget.services.sessionService,
      ),
      ConsoleScreen(
        connectionService: widget.services.connectionService,
        sessionService: widget.services.sessionService,
      ),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F1E3), Color(0xFFE9F0EE), Color(0xFFF4F1EA)],
          ),
        ),
        child: SafeArea(child: screens[_selectedIndex]),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Icon(Icons.hub_outlined),
            selectedIcon: Icon(Icons.hub),
            label: 'Console',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_outlined),
            selectedIcon: Icon(Icons.tune),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
