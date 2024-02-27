import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/main.dart' as app;

Future<void> init_app(WidgetTester tester) async {
  await app.main();
  await tester.pump(Duration(seconds: 5));
}
