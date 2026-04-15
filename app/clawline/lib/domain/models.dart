enum ConnectionStage {
  disconnected,
  connecting,
  connected,
  degraded,
  reconnecting,
  failed,
}

enum SessionRunState { idle, running, waitingForApproval, failed }

enum MessageAuthor { operator, assistant, tool, system }

enum ActivityKind { run, tool, approval, warning, console }

enum ActivitySeverity { info, success, attention, warning, critical }

class GatewayIdentity {
  const GatewayIdentity({
    required this.name,
    required this.endpoint,
    required this.trustLabel,
    required this.transportLabel,
  });

  final String name;
  final String endpoint;
  final String trustLabel;
  final String transportLabel;
}

class ConnectionSnapshot {
  const ConnectionSnapshot({
    required this.stage,
    required this.identity,
    required this.detail,
    required this.lastUpdated,
  });

  final ConnectionStage stage;
  final GatewayIdentity identity;
  final String detail;
  final DateTime lastUpdated;
}

class SessionSummary {
  const SessionSummary({
    required this.id,
    required this.title,
    required this.agent,
    required this.preview,
    required this.runState,
    required this.unreadCount,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String agent;
  final String preview;
  final SessionRunState runState;
  final int unreadCount;
  final DateTime updatedAt;
}

class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.author,
    required this.text,
    required this.timestamp,
  });

  final String id;
  final MessageAuthor author;
  final String text;
  final DateTime timestamp;
}

class ActivityItem {
  const ActivityItem({
    required this.id,
    required this.sessionId,
    required this.kind,
    required this.severity,
    required this.title,
    required this.detail,
    required this.timestamp,
  });

  final String id;
  final String sessionId;
  final ActivityKind kind;
  final ActivitySeverity severity;
  final String title;
  final String detail;
  final DateTime timestamp;
}

class ConsoleHealthItem {
  const ConsoleHealthItem({
    required this.label,
    required this.detail,
    required this.healthy,
  });

  final String label;
  final String detail;
  final bool healthy;
}

class GatewayOverview {
  const GatewayOverview({
    required this.connectedNodes,
    required this.connectedChannels,
    required this.installedSkills,
    required this.activeAutomations,
    required this.pendingApprovals,
    required this.surfaces,
  });

  final int connectedNodes;
  final int connectedChannels;
  final int installedSkills;
  final int activeAutomations;
  final int pendingApprovals;
  final List<ConsoleHealthItem> surfaces;
}
