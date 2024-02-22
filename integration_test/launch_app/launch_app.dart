import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/main.dart' as main_app;

class launch {
  late WidgetTester tester;
  launch(this.tester);

  Future<void> launch_app() async {
    await main_app.main();
    await tester.pump(const Duration(seconds: 6));
  }
}
