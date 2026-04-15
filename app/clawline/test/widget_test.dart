import 'package:clawline/app/bootstrap.dart';
import 'package:clawline/app/clawline_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders shell with primary destinations and selected session', (
    tester,
  ) async {
    final services = await bootstrapClawlineApp();

    await tester.pumpWidget(ClawlineApp(services: services));
    await tester.pump();

    expect(find.text('Chats'), findsWidgets);
    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('Console'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Main operator loop'), findsOneWidget);
    expect(find.text('Composer shell'), findsOneWidget);
  });
}
