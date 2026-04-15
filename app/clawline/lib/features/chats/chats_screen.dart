import 'package:flutter/material.dart';

import '../../core/widgets/panel_card.dart';
import '../../core/widgets/status_pill.dart';
import '../../domain/models.dart';
import '../../services/connection_service.dart';
import '../../services/session_service.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({
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
        final snapshot = connectionService.snapshot;
        final sessions = sessionService.sessions;
        final currentSession = sessionService.currentSession;
        final messages = sessionService.currentMessages;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
          children: [
            Text('Chats', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            Text(
              'Sessions stay first-class so chat, activity, and operator state all read from the same route.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            PanelCard(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primaryContainer.withAlpha(155),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      StatusPill(
                        label: _connectionLabel(snapshot.stage),
                        color: _connectionColor(snapshot.stage),
                        icon: Icons.wifi_tethering,
                      ),
                      StatusPill(
                        label: snapshot.identity.trustLabel,
                        color: Theme.of(context).colorScheme.secondary,
                        icon: Icons.verified_user_outlined,
                      ),
                      StatusPill(
                        label: snapshot.identity.transportLabel,
                        color: Theme.of(context).colorScheme.primary,
                        icon: Icons.hub_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    snapshot.identity.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    snapshot.identity.endpoint,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    snapshot.detail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Active sessions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            for (final session in sessions) ...[
              _SessionCard(
                session: session,
                selected: session.id == currentSession?.id,
                onTap: () => sessionService.selectSession(session.id),
              ),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 8),
            if (currentSession != null) ...[
              PanelCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSession.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Agent route: ${currentSession.agent}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        StatusPill(
                          label: _runStateLabel(currentSession.runState),
                          color: _runStateColor(currentSession.runState),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    for (final message in messages) ...[
                      _MessageBubble(message: message),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 18),
              PanelCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Composer shell',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Voice, attachments, and send are intentionally scaffolded before the live gateway write path lands.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest
                                  .withAlpha(120),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Text(
                                'Reply into the active session once write APIs are wired.',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton.filledTonal(
                          onPressed: null,
                          icon: const Icon(Icons.mic_none_outlined),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filled(
                          onPressed: null,
                          icon: const Icon(Icons.arrow_upward),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Color _connectionColor(ConnectionStage stage) {
    return switch (stage) {
      ConnectionStage.connected => const Color(0xFF1B7F5B),
      ConnectionStage.degraded => const Color(0xFFB26A00),
      ConnectionStage.connecting ||
      ConnectionStage.reconnecting => const Color(0xFF0B5D66),
      ConnectionStage.disconnected ||
      ConnectionStage.failed => const Color(0xFFB3261E),
    };
  }

  String _connectionLabel(ConnectionStage stage) {
    return switch (stage) {
      ConnectionStage.connected => 'Connected',
      ConnectionStage.degraded => 'Degraded',
      ConnectionStage.connecting => 'Connecting',
      ConnectionStage.reconnecting => 'Reconnecting',
      ConnectionStage.disconnected => 'Disconnected',
      ConnectionStage.failed => 'Failed',
    };
  }

  Color _runStateColor(SessionRunState state) {
    return switch (state) {
      SessionRunState.idle => const Color(0xFF0B5D66),
      SessionRunState.running => const Color(0xFF1B7F5B),
      SessionRunState.waitingForApproval => const Color(0xFFB26A00),
      SessionRunState.failed => const Color(0xFFB3261E),
    };
  }

  String _runStateLabel(SessionRunState state) {
    return switch (state) {
      SessionRunState.idle => 'Idle',
      SessionRunState.running => 'Running',
      SessionRunState.waitingForApproval => 'Approval',
      SessionRunState.failed => 'Failed',
    };
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({
    required this.session,
    required this.selected,
    required this.onTap,
  });

  final SessionSummary session;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: PanelCard(
        backgroundColor: selected
            ? Theme.of(context).colorScheme.primaryContainer.withAlpha(175)
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    session.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                StatusPill(
                  label: session.agent,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              session.preview,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                StatusPill(
                  label: switch (session.runState) {
                    SessionRunState.idle => 'Idle',
                    SessionRunState.running => 'Running',
                    SessionRunState.waitingForApproval => 'Approval',
                    SessionRunState.failed => 'Failed',
                  },
                  color: switch (session.runState) {
                    SessionRunState.idle => const Color(0xFF0B5D66),
                    SessionRunState.running => const Color(0xFF1B7F5B),
                    SessionRunState.waitingForApproval => const Color(
                      0xFFB26A00,
                    ),
                    SessionRunState.failed => const Color(0xFFB3261E),
                  },
                ),
                const Spacer(),
                if (session.unreadCount > 0)
                  StatusPill(
                    label: '${session.unreadCount} unread',
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOperator = message.author == MessageAuthor.operator;
    final isTool = message.author == MessageAuthor.tool;
    final bubbleColor = isOperator
        ? theme.colorScheme.primary
        : isTool
        ? theme.colorScheme.secondaryContainer
        : theme.colorScheme.surfaceContainerHighest;
    final textColor = isOperator
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;

    return Align(
      alignment: isOperator ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  switch (message.author) {
                    MessageAuthor.operator => 'You',
                    MessageAuthor.assistant => 'Assistant',
                    MessageAuthor.tool => 'Tool',
                    MessageAuthor.system => 'System',
                  },
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: textColor.withAlpha(190),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message.text,
                  style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
