import 'package:flutter/material.dart';

import '../../core/widgets/panel_card.dart';
import '../../core/widgets/status_pill.dart';
import '../../domain/models.dart';
import '../../services/connection_service.dart';
import '../../services/session_service.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({
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
        final activity = sessionService.currentActivity;
        final session = sessionService.currentSession;
        final approvals = activity
            .where((item) => item.kind == ActivityKind.approval)
            .toList(growable: false);

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
          children: [
            Text('Activity', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              session == null
                  ? 'Live operator signals will land here as sessions load.'
                  : 'Focused on ${session.title} so you can see the run before diving into raw logs.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            PanelCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current pulse',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildStatePill(context, session?.runState),
                      StatusPill(
                        label:
                            connectionService.snapshot.identity.transportLabel,
                        color: Theme.of(context).colorScheme.secondary,
                        icon: Icons.hub_outlined,
                      ),
                      StatusPill(
                        label: approvals.isEmpty
                            ? 'No approvals waiting'
                            : '${approvals.length} approval queued',
                        color: approvals.isEmpty
                            ? const Color(0xFF1B7F5B)
                            : const Color(0xFFB26A00),
                        icon: approvals.isEmpty
                            ? Icons.check_circle_outline
                            : Icons.pending_actions_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    connectionService.snapshot.detail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            for (final item in activity) ...[
              PanelCard(
                padding: const EdgeInsets.all(18),
                backgroundColor: _cardTint(item.severity),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        StatusPill(
                          label: _kindLabel(item.kind),
                          color: _severityColor(item.severity),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.detail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _formatTime(item.timestamp),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
            ],
          ],
        );
      },
    );
  }

  Widget _buildStatePill(BuildContext context, SessionRunState? state) {
    final theme = Theme.of(context);
    if (state == null) {
      return const PanelCard(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text('No session selected'),
      );
    }

    return PanelCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      backgroundColor: theme.colorScheme.primaryContainer.withAlpha(165),
      child: Text(switch (state) {
        SessionRunState.idle => 'Idle session',
        SessionRunState.running => 'Run in progress',
        SessionRunState.waitingForApproval => 'Waiting for approval',
        SessionRunState.failed => 'Action required',
      }, style: theme.textTheme.labelLarge),
    );
  }

  Color _severityColor(ActivitySeverity severity) {
    return switch (severity) {
      ActivitySeverity.info => const Color(0xFF0B5D66),
      ActivitySeverity.success => const Color(0xFF1B7F5B),
      ActivitySeverity.attention => const Color(0xFFB26A00),
      ActivitySeverity.warning => const Color(0xFFC25A16),
      ActivitySeverity.critical => const Color(0xFFB3261E),
    };
  }

  Color _cardTint(ActivitySeverity severity) {
    return _severityColor(severity).withAlpha(16);
  }

  String _kindLabel(ActivityKind kind) {
    return switch (kind) {
      ActivityKind.run => 'Run',
      ActivityKind.tool => 'Tool',
      ActivityKind.approval => 'Approval',
      ActivityKind.warning => 'Warning',
      ActivityKind.console => 'Console',
    };
  }

  String _formatTime(DateTime timestamp) {
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '${timestamp.hour}:$minute';
  }
}
