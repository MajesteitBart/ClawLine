import 'package:clawline/data/gateway/fake_gateway_repository.dart';
import 'package:clawline/domain/models.dart';
import 'package:clawline/services/connection_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('hydrates a connected gateway snapshot', () async {
    final service = ConnectionService(repository: FakeGatewayRepository());

    await service.refresh();

    expect(service.snapshot.stage, ConnectionStage.connected);
    expect(service.snapshot.identity.transportLabel, 'WebSocket');
    expect(service.isLoading, isFalse);
  });
}
