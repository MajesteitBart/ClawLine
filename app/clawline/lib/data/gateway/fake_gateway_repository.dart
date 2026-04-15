import '../../domain/models.dart';
import 'gateway_contract.dart';

class FakeGatewayRepository implements GatewayRepository {
  static const _gatewayIdentity = GatewayIdentity(
    name: 'Bart main gateway',
    endpoint: 'wss://gateway.openclaw.internal/mobile',
    trustLabel: 'Private route',
    transportLabel: 'WebSocket',
  );

  final List<SessionSummary> _sessions = [
    SessionSummary(
      id: 'main-ops',
      title: 'Main operator loop',
      agent: 'main',
      preview: 'Summaries are landing. One approval is still waiting.',
      runState: SessionRunState.waitingForApproval,
      unreadCount: 1,
      updatedAt: DateTime(2026, 4, 16, 8, 42),
    ),
    SessionSummary(
      id: 'gateway-debug',
      title: 'Gateway reconnect debug',
      agent: 'coding',
      preview: 'Retry path looks cleaner after the transport split.',
      runState: SessionRunState.running,
      unreadCount: 0,
      updatedAt: DateTime(2026, 4, 16, 7, 58),
    ),
    SessionSummary(
      id: 'release-notes',
      title: 'Alpha release prep',
      agent: 'writer',
      preview: 'Draft internal notes before the first device smoke run.',
      runState: SessionRunState.idle,
      unreadCount: 0,
      updatedAt: DateTime(2026, 4, 15, 22, 30),
    ),
  ];

  final Map<String, List<ChatMessage>> _messages = {
    'main-ops': [
      ChatMessage(
        id: 'm-1',
        author: MessageAuthor.assistant,
        text:
            'Activity stayed healthy overnight. One run is paused for approval.',
        timestamp: DateTime(2026, 4, 16, 8, 31),
      ),
      ChatMessage(
        id: 'm-2',
        author: MessageAuthor.operator,
        text:
            'Surface the approval first and keep the noisy tool logs collapsed.',
        timestamp: DateTime(2026, 4, 16, 8, 34),
      ),
      ChatMessage(
        id: 'm-3',
        author: MessageAuthor.tool,
        text: 'tool.exec: build validation finished with one warning in ws-b.',
        timestamp: DateTime(2026, 4, 16, 8, 38),
      ),
      ChatMessage(
        id: 'm-4',
        author: MessageAuthor.assistant,
        text:
            'Queued the approval summary and kept the session route pinned to main.',
        timestamp: DateTime(2026, 4, 16, 8, 41),
      ),
    ],
    'gateway-debug': [
      ChatMessage(
        id: 'g-1',
        author: MessageAuthor.operator,
        text: 'Map reconnect states before we wire the live socket.',
        timestamp: DateTime(2026, 4, 16, 7, 41),
      ),
      ChatMessage(
        id: 'g-2',
        author: MessageAuthor.assistant,
        text:
            'Current draft separates transport health, auth trust, and session hydration.',
        timestamp: DateTime(2026, 4, 16, 7, 49),
      ),
      ChatMessage(
        id: 'g-3',
        author: MessageAuthor.tool,
        text: 'tool.diff: contract notes updated with reconnect edge cases.',
        timestamp: DateTime(2026, 4, 16, 7, 54),
      ),
    ],
    'release-notes': [
      ChatMessage(
        id: 'r-1',
        author: MessageAuthor.assistant,
        text:
            'Internal alpha should call out session-first chat, approvals, and console health.',
        timestamp: DateTime(2026, 4, 15, 22, 10),
      ),
    ],
  };

  final List<ActivityItem> _activity = [
    ActivityItem(
      id: 'a-1',
      sessionId: 'main-ops',
      kind: ActivityKind.approval,
      severity: ActivitySeverity.attention,
      title: 'Approval waiting',
      detail:
          'Skill install requires confirmation before the run can continue.',
      timestamp: DateTime(2026, 4, 16, 8, 40),
    ),
    ActivityItem(
      id: 'a-2',
      sessionId: 'main-ops',
      kind: ActivityKind.tool,
      severity: ActivitySeverity.info,
      title: 'Summary pipeline finished',
      detail:
          'Transcript summarizer pushed a compact state bundle back to the gateway.',
      timestamp: DateTime(2026, 4, 16, 8, 32),
    ),
    ActivityItem(
      id: 'a-3',
      sessionId: 'gateway-debug',
      kind: ActivityKind.run,
      severity: ActivitySeverity.info,
      title: 'Reconnect loop under review',
      detail:
          'Transport model split makes degraded state visible without dropping the session.',
      timestamp: DateTime(2026, 4, 16, 7, 56),
    ),
    ActivityItem(
      id: 'a-4',
      sessionId: 'gateway-debug',
      kind: ActivityKind.warning,
      severity: ActivitySeverity.warning,
      title: 'Auth refresh not wired',
      detail:
          'Token refresh remains a follow-up for the live gateway integration.',
      timestamp: DateTime(2026, 4, 16, 7, 52),
    ),
    ActivityItem(
      id: 'a-5',
      sessionId: 'release-notes',
      kind: ActivityKind.console,
      severity: ActivitySeverity.success,
      title: 'Alpha checklist drafted',
      detail: 'Read-first console scope now fits the first mobile release.',
      timestamp: DateTime(2026, 4, 15, 22, 18),
    ),
  ];

  @override
  Future<ConnectionSnapshot> loadConnectionSnapshot() async {
    await Future<void>.delayed(const Duration(milliseconds: 60));
    return ConnectionSnapshot(
      stage: ConnectionStage.connected,
      identity: _gatewayIdentity,
      detail: 'Stable private route with cached session snapshot ready.',
      lastUpdated: DateTime(2026, 4, 16, 8, 42),
    );
  }

  @override
  Future<GatewayOverview> loadGatewayOverview() async {
    await Future<void>.delayed(const Duration(milliseconds: 40));
    return GatewayOverview(
      connectedNodes: 3,
      connectedChannels: 4,
      installedSkills: 17,
      activeAutomations: 5,
      pendingApprovals: 1,
      surfaces: const [
        ConsoleHealthItem(
          label: 'Nodes',
          detail: 'Android companion is planned, desktop relay is healthy.',
          healthy: true,
        ),
        ConsoleHealthItem(
          label: 'Channels',
          detail: 'Telegram and Discord are logged in; WhatsApp is idle.',
          healthy: true,
        ),
        ConsoleHealthItem(
          label: 'Skills',
          detail: 'One install is paused for approval review.',
          healthy: false,
        ),
        ConsoleHealthItem(
          label: 'Cron',
          detail: 'Nightly summaries and health pings completed on schedule.',
          healthy: true,
        ),
      ],
    );
  }

  @override
  Future<List<ActivityItem>> listActivity({String? sessionId}) async {
    await Future<void>.delayed(const Duration(milliseconds: 30));
    final filtered = sessionId == null
        ? _activity
        : _activity.where((item) => item.sessionId == sessionId).toList();
    return filtered.toList()
      ..sort((left, right) => right.timestamp.compareTo(left.timestamp));
  }

  @override
  Future<List<ChatMessage>> listMessages(String sessionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 30));
    return List<ChatMessage>.from(_messages[sessionId] ?? const []);
  }

  @override
  Future<List<SessionSummary>> listSessions() async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    return List<SessionSummary>.from(_sessions)
      ..sort((left, right) => right.updatedAt.compareTo(left.updatedAt));
  }
}
