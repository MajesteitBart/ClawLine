import 'package:flutter/foundation.dart';

import '../data/gateway/gateway_contract.dart';
import '../domain/models.dart';

class SessionService extends ChangeNotifier {
  SessionService({required GatewayRepository repository})
    : _repository = repository;

  final GatewayRepository _repository;

  List<SessionSummary> _sessions = const [];
  GatewayOverview? _gatewayOverview;
  List<ActivityItem> _currentActivity = const [];
  final Map<String, List<ChatMessage>> _messages = {};
  String? _selectedSessionId;
  bool _isLoading = false;
  String? _errorMessage;

  List<SessionSummary> get sessions => _sessions;
  GatewayOverview? get gatewayOverview => _gatewayOverview;
  List<ActivityItem> get currentActivity => _currentActivity;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  SessionSummary? get currentSession {
    if (_selectedSessionId == null) {
      return null;
    }
    for (final session in _sessions) {
      if (session.id == _selectedSessionId) {
        return session;
      }
    }
    return null;
  }

  List<ChatMessage> get currentMessages {
    final sessionId = _selectedSessionId;
    if (sessionId == null) {
      return const [];
    }
    return _messages[sessionId] ?? const [];
  }

  Future<void> load() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final sessions = await _repository.listSessions();
      _sessions = sessions;
      _selectedSessionId ??= sessions.isEmpty ? null : sessions.first.id;
      _gatewayOverview = await _repository.loadGatewayOverview();
      await _loadCurrentSessionArtifacts();
    } catch (_) {
      _errorMessage = 'Unable to load session-first shell data.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> selectSession(String sessionId) async {
    if (_selectedSessionId == sessionId) {
      return;
    }

    _selectedSessionId = sessionId;
    notifyListeners();
    await _loadCurrentSessionArtifacts();
    notifyListeners();
  }

  Future<void> _loadCurrentSessionArtifacts() async {
    final sessionId = _selectedSessionId;
    if (sessionId == null) {
      _currentActivity = const [];
      return;
    }

    _messages[sessionId] = await _repository.listMessages(sessionId);
    _currentActivity = await _repository.listActivity(sessionId: sessionId);
  }
}
