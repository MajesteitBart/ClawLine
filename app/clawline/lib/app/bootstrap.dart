import '../data/gateway/fake_gateway_repository.dart';
import '../data/gateway/gateway_contract.dart';
import '../services/connection_service.dart';
import '../services/session_service.dart';

class ClawlineServices {
  ClawlineServices({
    required this.gatewayRepository,
    required this.connectionService,
    required this.sessionService,
  });

  final GatewayRepository gatewayRepository;
  final ConnectionService connectionService;
  final SessionService sessionService;
}

Future<ClawlineServices> bootstrapClawlineApp() async {
  final repository = FakeGatewayRepository();
  final connectionService = ConnectionService(repository: repository);
  final sessionService = SessionService(repository: repository);

  await Future.wait([connectionService.refresh(), sessionService.load()]);

  return ClawlineServices(
    gatewayRepository: repository,
    connectionService: connectionService,
    sessionService: sessionService,
  );
}
