import 'package:flutter_test/flutter_test.dart';

import 'package:qora/app/app.dart';

void main() {
  testWidgets('App loads role selection screen', (WidgetTester tester) async {
    await tester.pumpWidget(const QoraApp());
    await tester.pumpAndSettle();

    expect(find.text('Choose Your Role'), findsOneWidget);
  });
}
