import 'package:flutter/material.dart';

import '../../core/widgets/panel_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
      children: [
        Text('Settings', style: theme.textTheme.headlineLarge),
        const SizedBox(height: 8),
        Text(
          'Alpha settings are deliberately thin until auth, reconnect, and persistence become real gateway work.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        const PanelCard(
          child: _SettingsList(
            title: 'Current defaults',
            items: [
              'One gateway authority with private-route expectations.',
              'Session-first navigation instead of transport-led tabs.',
              'Read-first console surfaces before risky admin mutation.',
            ],
          ),
        ),
        const SizedBox(height: 16),
        const PanelCard(
          child: _SettingsList(
            title: 'Gateway contract follow-ups',
            items: [
              'Finalize WebSocket auth handshake and refresh behavior.',
              'Define transcript pagination and activity streaming boundaries.',
              'Choose secure local persistence once live session hydration exists.',
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsList extends StatelessWidget {
  const _SettingsList({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        for (final item in items) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.circle, size: 8),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
