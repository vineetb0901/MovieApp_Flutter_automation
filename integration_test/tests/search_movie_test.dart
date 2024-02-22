import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r08fullmovieapp/main.dart' as main_app;

import '../finders/finders.dart';
import '../launch_app/launch_app.dart';
import '../screens/home_screen.dart';
import '../screens/movie_screens.dart';

void main() {
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  bindings.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  group("sample", () {
    // testWidgets("Testing SearchBar", (tester) async {
    //   final launchObj = launch(tester);

    //   await launchObj.launch_app();
    //   final homeScreenObj = home_screen(tester);
    //   await homeScreenObj.search_movie("Legend");

    //   // await main_app.main();
    //   // await tester.pump(const Duration(seconds: 5));
    //   // final searchField = find.byType(TextField);
    //   // await tester.pump(const Duration(seconds: 5));
    //   // await tester.enterText(searchField, "Legend");
    //   // await tester.testTextInput.receiveAction(TextInputAction.done);
    //   // await tester.pump(const Duration(seconds: 5));
    // });

    testWidgets("select category", (tester) async {
      final launchobj = launch(tester);
      await launchobj.launch_app();
      home_screen homeScreenObj = home_screen(tester);

      await homeScreenObj.selectCatagories("Movies");
      final movieScreenObj = await homeScreenObj.selectMovieCard();
      await movieScreenObj.addToFavorites();
      await tester.pump(Duration(seconds: 5));
      await movieScreenObj.backToHomeScreen();

    });
  });
}
