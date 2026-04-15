import 'package:flutter/widgets.dart';

import 'app/bootstrap.dart';
import 'app/clawline_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = await bootstrapClawlineApp();
  runApp(ClawlineApp(services: services));
}
