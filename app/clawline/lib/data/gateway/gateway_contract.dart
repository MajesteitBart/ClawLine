import '../../domain/models.dart';

/// GatewayRepository defines the mobile-facing read model for the alpha shell.
///
/// Open contract questions retained intentionally for T-002:
/// - What does the authenticated WebSocket handshake payload look like in the
///   final gateway flow, and which credentials are refreshable on-device?
/// - Which admin endpoints should be normalized into a single read model versus
///   consumed separately for chats, activity, and console health?
/// - How should session activity and transcript pagination work for long-running
///   sessions on mobile without turning the app into a second source of truth?
abstract interface class GatewayRepository {
  Future<ConnectionSnapshot> loadConnectionSnapshot();

  Future<List<SessionSummary>> listSessions();

  Future<List<ChatMessage>> listMessages(String sessionId);

  Future<List<ActivityItem>> listActivity({String? sessionId});

  Future<GatewayOverview> loadGatewayOverview();
}
