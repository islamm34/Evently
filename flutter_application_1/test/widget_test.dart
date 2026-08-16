import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('App loads role selection screen', (WidgetTester tester) async {
    await tester.pumpWidget(const CoffeeShopApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Qora'), findsOneWidget);
  });
}
