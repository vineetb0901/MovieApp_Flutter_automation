import 'package:r08fullmovieapp/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

Future<void> initApp(WidgetTester tester) async {
  await app.main();
  await tester.pump(const Duration(seconds: 7));
}
