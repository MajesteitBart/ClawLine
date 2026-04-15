import 'package:flutter/material.dart';

import '../../core/widgets/panel_card.dart';
import '../../core/widgets/status_pill.dart';
import '../../services/connection_service.dart';
import '../../services/session_service.dart';

class ConsoleScreen extends StatelessWidget {
  const ConsoleScreen({
    super.key,
    required this.connectionService,
    required this.sessionService,
  });

  final ConnectionService connectionService;
  final SessionService sessionService;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([connectionService, sessionService]),
      builder: (context, _) {
        final overview = sessionService.gatewayOverview;
        final snapshot = connectionService.snapshot;
        final theme = Theme.of(context);

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
          children: [
            Text('Console', style: theme.textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              'Read-first gateway health stays visible without dragging desktop admin complexity onto a phone.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            PanelCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gateway route', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  Text(
                    snapshot.identity.name,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    snapshot.identity.endpoint,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      StatusPill(
                        label: snapshot.identity.trustLabel,
                        color: theme.colorScheme.secondary,
                        icon: Icons.verified_user_outlined,
                      ),
                      StatusPill(
                        label:
                            '${overview?.pendingApprovals ?? 0} pending approvals',
                        color: (overview?.pendingApprovals ?? 0) == 0
                            ? const Color(0xFF1B7F5B)
                            : const Color(0xFFB26A00),
                        icon: Icons.pending_actions_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _MetricCard(
                  label: 'Nodes',
                  value: '${overview?.connectedNodes ?? 0}',
                  accent: const Color(0xFF0B5D66),
                ),
                _MetricCard(
                  label: 'Channels',
                  value: '${overview?.connectedChannels ?? 0}',
                  accent: const Color(0xFF7D5A27),
                ),
                _MetricCard(
                  label: 'Skills',
                  value: '${overview?.installedSkills ?? 0}',
                  accent: const Color(0xFFB44F35),
                ),
                _MetricCard(
                  label: 'Cron',
                  value: '${overview?.activeAutomations ?? 0}',
                  accent: const Color(0xFF1B7F5B),
                ),
              ],
            ),
            const SizedBox(height: 18),
            if (overview != null)
              for (final surface in overview.surfaces) ...[
                PanelCard(
                  padding: const EdgeInsets.all(18),
                  backgroundColor:
                      (surface.healthy
                              ? const Color(0xFF1B7F5B)
                              : const Color(0xFFB26A00))
                          .withAlpha(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        surface.healthy
                            ? Icons.check_circle
                            : Icons.warning_amber,
                        color: surface.healthy
                            ? const Color(0xFF1B7F5B)
                            : const Color(0xFFB26A00),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              surface.label,
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              surface.detail,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
          ],
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.accent,
  });

  final String label;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: PanelCard(
        backgroundColor: accent.withAlpha(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: accent),
            ),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
