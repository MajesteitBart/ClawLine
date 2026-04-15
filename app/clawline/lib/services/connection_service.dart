import 'package:flutter/foundation.dart';

import '../data/gateway/gateway_contract.dart';
import '../domain/models.dart';

class ConnectionService extends ChangeNotifier {
  ConnectionService({required GatewayRepository repository})
    : _repository = repository;

  final GatewayRepository _repository;

  ConnectionSnapshot _snapshot = ConnectionSnapshot(
    stage: ConnectionStage.connecting,
    identity: const GatewayIdentity(
      name: 'Connecting gateway',
      endpoint: 'wss://pending',
      trustLabel: 'Pending trust',
      transportLabel: 'WebSocket',
    ),
    detail: 'Preparing local shell and hydration path.',
    lastUpdated: DateTime(2026, 4, 16),
  );

  bool _isLoading = false;

  ConnectionSnapshot get snapshot => _snapshot;
  bool get isLoading => _isLoading;

  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();

    try {
      _snapshot = await _repository.loadConnectionSnapshot();
    } catch (_) {
      _snapshot = ConnectionSnapshot(
        stage: ConnectionStage.failed,
        identity: _snapshot.identity,
        detail: 'Unable to hydrate gateway state in the current shell.',
        lastUpdated: DateTime.now(),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
