import 'package:clawline/data/gateway/fake_gateway_repository.dart';
import 'package:clawline/services/session_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'loads sessions and allows selecting a different active session',
    () async {
      final service = SessionService(repository: FakeGatewayRepository());

      await service.load();

      expect(service.sessions, isNotEmpty);
      expect(service.currentSession?.id, 'main-ops');

      await service.selectSession('gateway-debug');

      expect(service.currentSession?.id, 'gateway-debug');
      expect(service.currentMessages, isNotEmpty);
      expect(service.currentActivity, isNotEmpty);
    },
  );
}
