import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_driver/flutter_driver.dart' ;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:r08fullmovieapp/main.dart' as app;

void main() {
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  group('end to end', () {
    testWidgets('Click on Movie tab', (tester) async {
      await app.main();

      await tester.pump(Duration(seconds: 7));
      final tab1Finder = find.text('Movies');
      await tester.tap(tab1Finder);
      await tester.pump();
    });

    testWidgets('Drop down box', (tester) async {
      await app.main();
      await tester.pump(Duration(seconds: 10));
      await tester.tap(find.text('Weekly'));
    });

    // testWidgets('CarouselSlider', (tester) async {
    //   await app.main();
    //   await tester.pump(Duration(seconds: 10));
    //   await tester.tap(find.byWidget(CarouselSlider,bool skipOffStage = true));
    // });
  });
}
