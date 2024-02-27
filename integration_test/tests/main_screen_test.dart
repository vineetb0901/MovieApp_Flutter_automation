import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../finders/finders.dart';
import '../fixtures/fixtures.dart';
import '../screens/home_screens.dart';

void main() {
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Movie MainScreen', () {
    testWidgets('Movies tab automation', (tester) async {
      await init_app(tester);
      await tester.pump();

      final homeScreen = HomeScreen(tester);
      await homeScreen.getUpcoming();
      await tester.pump();
      final testUpcoming = homeScreen.upcomingTabFinder();
      expect(testUpcoming, findsOneWidget);
    });
  });
}
